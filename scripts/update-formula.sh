#!/usr/bin/env bash
set -euo pipefail

tool=${1:?usage: scripts/update-formula.sh <agx|semlint>}
case "$tool" in
  agx|semlint) ;;
  *) printf 'unsupported tool: %s\n' "$tool" >&2; exit 2 ;;
esac

root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
template="$root/templates/$tool.rb"
formula="$root/Formula/$tool.rb"
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

if ! tag=$(gh release view --repo "fuyutarow/$tool" --json tagName --jq .tagName); then
  printf 'unable to read latest release for %s\n' "$tool" >&2
  exit 3
fi
if [[ -z "$tag" ]]; then
  printf 'latest release is unavailable for %s\n' "$tool" >&2
  exit 3
fi
version=${tag#v}
platforms=(darwin-arm64 darwin-x64 linux-arm64 linux-x64)

for platform in "${platforms[@]}"; do
  asset="$tool-$version-$platform.tar.gz"
  gh release download "$tag" --repo "fuyutarow/$tool" --pattern "$asset" --dir "$tmp"
  if [[ ! -s "$tmp/$asset" ]]; then
    printf 'required release asset missing: %s\n' "$asset" >&2
    exit 1
  fi
done

rendered="$tmp/$tool.rb"
cp "$template" "$rendered"
for platform in "${platforms[@]}"; do
  key=${platform^^}
  key=${key//-/_}
  sha=$(sha256sum "$tmp/$tool-$version-$platform.tar.gz" | cut -d ' ' -f 1)
  placeholder="@SHA_$key@"
  sed "s/$placeholder/$sha/g" "$rendered" > "$tmp/rendered.rb"
  mv "$tmp/rendered.rb" "$rendered"
done
sed "s/@VERSION@/$version/g" "$rendered" > "$tmp/final.rb"
if grep -Eq '@(VERSION|SHA_[A-Z_]+)@' "$tmp/final.rb"; then
  printf 'template contains an unresolved placeholder: %s\n' "$template" >&2
  exit 1
fi
mkdir -p "$(dirname "$formula")"
if [[ -f "$formula" ]] && cmp -s "$tmp/final.rb" "$formula"; then
  printf 'unchanged %s\n' "$version"
else
  install -m 0644 "$tmp/final.rb" "$formula"
  printf 'changed %s\n' "$version"
fi
