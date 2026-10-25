#!/usr/bin/env bash
set -euo pipefail

root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
mkdir -p "$tmp/bin"
cat > "$tmp/bin/gh" <<'GH'
#!/usr/bin/env bash
set -euo pipefail
[[ -n "${GH_TOKEN:-}" ]] || { echo 'GH_TOKEN missing' >&2; exit 90; }
case "${1:-}" in
  release)
    shift
    case "${1:-}" in
      view)
        repo=''
        while (($#)); do
          if [[ "$1" == --repo ]]; then repo=$2; shift 2; else shift; fi
        done
        case "$repo" in
          fuyutarow/agx) echo v1.11.3 ;;
          fuyutarow/dx) echo v0.1.6 ;;
          *) exit 91 ;;
        esac
        ;;
      download)
        tag=$2; shift 2
        repo=''; pattern=''; dest=''
        while (($#)); do
          case "$1" in
            --repo) repo=$2; shift 2 ;;
            --pattern) pattern=$2; shift 2 ;;
            --dir) dest=$2; shift 2 ;;
            *) shift ;;
          esac
        done
        tool=''; version=''
        [[ "$repo" == fuyutarow/agx && "$tag" == v1.11.3 ]] && tool=agx && version=1.11.3
        [[ "$repo" == fuyutarow/dx && "$tag" == v0.1.6 ]] && tool=dx && version=0.1.6
        [[ -n "$tool" && -n "$pattern" && -n "$dest" ]] || exit 92
        platform=${pattern#"$tool-$version-"}
        if [[ "${FAKE_MISSING:-}" == "$platform" ]]; then exit 1; fi
        cp "$FIXTURE_ROOT/$tool-$version-$platform" "$dest/$pattern"
        ;;
      *) exit 93 ;;
    esac
    ;;
  *) exit 94 ;;
esac
GH
chmod +x "$tmp/bin/gh"
export PATH="$tmp/bin:$PATH" GH_TOKEN=fixture-token FIXTURE_ROOT="$root/tests/fixtures"

assert_contains() {
  grep -Fq -- "$2" "$1" || { printf 'missing expected text: %s\n' "$2" >&2; exit 1; }
}

for pair in agx:1.11.3 dx:0.1.6; do
  tool=${pair%%:*}; version=${pair#*:}
  repo="$tmp/$tool"
  mkdir -p "$repo/scripts" "$repo/templates" "$repo/Formula"
  cp "$root/scripts/update-formula.sh" "$repo/scripts/"
  cp "$root/templates/$tool.rb" "$repo/templates/"
  output=$(cd "$repo" && bash scripts/update-formula.sh "$tool")
  [[ "$output" == "changed $version" ]]
  formula="$repo/Formula/$tool.rb"
  for platform in darwin-arm64 darwin-x64 linux-arm64 linux-x64; do
    os=${platform%-*}; arch=${platform#*-}
    expected_sha=$(sha256sum "$root/tests/fixtures/$tool-$version-$platform.tar.gz" | cut -d ' ' -f 1)
    assert_contains "$formula" "https://github.com/fuyutarow/$tool/releases/download/v$version/$tool-$version-$os-$arch.tar.gz"
    assert_contains "$formula" "sha256 \"$expected_sha\""
  done
  before=$(sha256sum "$formula" | cut -d ' ' -f 1)
  output=$(cd "$repo" && bash scripts/update-formula.sh "$tool")
  [[ "$output" == "unchanged $version" ]]
  after=$(sha256sum "$formula" | cut -d ' ' -f 1)
  [[ "$before" == "$after" ]]
done

repo="$tmp/missing"
mkdir -p "$repo/scripts" "$repo/templates" "$repo/Formula"
cp "$root/scripts/update-formula.sh" "$repo/scripts/"
cp "$root/templates/agx.rb" "$repo/templates/"
printf 'sentinel formula\n' > "$repo/Formula/agx.rb"
before=$(sha256sum "$repo/Formula/agx.rb" | cut -d ' ' -f 1)
if (cd "$repo" && FAKE_MISSING=linux-x64.tar.gz bash scripts/update-formula.sh agx); then
  echo 'updater unexpectedly succeeded with a missing asset' >&2
  exit 1
fi
after=$(sha256sum "$repo/Formula/agx.rb" | cut -d ' ' -f 1)
[[ "$before" == "$after" ]]
echo 'offline formula updater checks passed'
