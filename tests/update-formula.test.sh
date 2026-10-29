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
        if [[ "${FAKE_UNREADABLE:-}" == "${repo#*/}" ]]; then exit 1; fi
        case "$repo" in
          fuyutarow/agx) echo v1.11.3 ;;
          fuyutarow/semlint) echo v0.2.0 ;;
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
        [[ "$repo" == fuyutarow/semlint && "$tag" == v0.2.0 ]] && tool=semlint && version=0.2.0
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

for pair in agx:1.11.3 semlint:0.2.0; do
  tool=${pair%%:*}; version=${pair#*:}
  repo="$tmp/$tool"
  mkdir -p "$repo/scripts" "$repo/templates" "$repo/Formula"
  cp "$root/scripts/update-formula.sh" "$repo/scripts/"
  cp "$root/templates/$tool.rb" "$repo/templates/"
  output=$(cd "$repo" && bash scripts/update-formula.sh "$tool")
  [[ "$output" == "changed $version" ]]
  formula="$repo/Formula/$tool.rb"
  assert_contains "$formula" 'Dir["*"]'
  assert_contains "$formula" 'Dir["bin/*"]'
  assert_contains "$formula" 'File.executable?(path)'
  assert_contains "$formula" 'raise "no executables found in archive"'
  for platform in darwin-arm64 darwin-x64 linux-arm64 linux-x64; do
    fixture="$root/tests/fixtures/$tool-$version-$platform.tar.gz"
    tar -tzf "$fixture" > "$tmp/archive.list"
    if ! grep -Eq '^bin/[^/]+$' "$tmp/archive.list"; then
      printf 'fixture contains no bin executables: %s\n' "$fixture" >&2
      exit 1
    fi
    extraction="$tmp/extract-$tool-$platform"
    direct_layout="$tmp/direct-$tool-$platform"
    mkdir -p "$extraction"
    tar -xzf "$fixture" -C "$extraction"
    mkdir -p "$direct_layout"
    cp -a "$extraction/bin/." "$direct_layout/"
    nested_count=$(find "$extraction/bin" -maxdepth 1 -type f -perm -111 | wc -l)
    direct_count=$(find "$direct_layout" -maxdepth 1 -type f -perm -111 | wc -l)
    [[ "$nested_count" -gt 0 && "$direct_count" -gt 0 ]] || {
      printf 'rendered formula would install zero executables: %s\n' "$fixture" >&2
      exit 1
    }
    os=${platform%-*}; arch=${platform#*-}
    expected_sha=$(sha256sum "$fixture" | cut -d ' ' -f 1)
    assert_contains "$formula" "https://github.com/fuyutarow/$tool/releases/download/v$version/$tool-$version-$os-$arch.tar.gz"
    assert_contains "$formula" "sha256 \"$expected_sha\""
  done
  before=$(sha256sum "$formula" | cut -d ' ' -f 1)
  output=$(cd "$repo" && bash scripts/update-formula.sh "$tool")
  [[ "$output" == "unchanged $version" ]]
  after=$(sha256sum "$formula" | cut -d ' ' -f 1)
  [[ "$before" == "$after" ]]
done

assert_contains "$root/templates/agx.rb" 'bin.install_symlink "agx-msg" => "xmsg"'
assert_contains "$root/.github/workflows/update-formulas.yml" 'scripts/update-formula.sh "$tool"'
assert_contains "$root/.github/workflows/update-formulas.yml" '::warning::Skipping $tool'
assert_contains "$root/.github/workflows/update-formulas.yml" 'if [[ "$status" == 3 ]]'

# Exercise the actual publish block with a local remote for new, unchanged,
# and modified formulas, without invoking GitHub Actions or the network.
awk '/^            git add -- / { copying=1 } copying { sub(/^            /, ""); print } copying && /^fi$/ { exit }' \
  "$root/.github/workflows/update-formulas.yml" > "$tmp/publish.sh"
[[ -s "$tmp/publish.sh" ]]
git init --bare -q "$tmp/remote.git"
git init -q "$tmp/publish"
git -C "$tmp/publish" config user.name test
git -C "$tmp/publish" config user.email test@example.com
git -C "$tmp/publish" remote add origin "$tmp/remote.git"
mkdir -p "$tmp/publish/Formula"
printf 'first\n' > "$tmp/publish/Formula/semlint.rb"
tool=semlint version=0.2.0
(cd "$tmp/publish" && source "$tmp/publish.sh")
first=$(git -C "$tmp/publish" rev-parse HEAD)
[[ $(git --git-dir="$tmp/remote.git" rev-parse refs/heads/alpha) == "$first" ]]
(cd "$tmp/publish" && source "$tmp/publish.sh")
[[ $(git -C "$tmp/publish" rev-parse HEAD) == "$first" ]]
printf 'second\n' > "$tmp/publish/Formula/semlint.rb"
(cd "$tmp/publish" && source "$tmp/publish.sh")
second=$(git -C "$tmp/publish" rev-parse HEAD)
[[ "$second" != "$first" ]]
[[ $(git --git-dir="$tmp/remote.git" rev-parse refs/heads/alpha) == "$second" ]]

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

if (cd "$repo" && FAKE_UNREADABLE=agx bash scripts/update-formula.sh agx); then
  echo 'updater unexpectedly succeeded when the release was unreadable' >&2
  exit 1
else
  status=$?
fi
[[ "$status" == 3 ]]
after=$(sha256sum "$repo/Formula/agx.rb" | cut -d ' ' -f 1)
[[ "$before" == "$after" ]]

cp "$root/templates/semlint.rb" "$repo/templates/"
printf 'sentinel semlint formula\n' > "$repo/Formula/semlint.rb"
before=$(sha256sum "$repo/Formula/semlint.rb" | cut -d ' ' -f 1)
if (cd "$repo" && FAKE_UNREADABLE=semlint bash scripts/update-formula.sh semlint); then
  echo 'updater unexpectedly succeeded when semlint release was unreadable' >&2
  exit 1
else
  status=$?
fi
[[ "$status" == 3 ]]
after=$(sha256sum "$repo/Formula/semlint.rb" | cut -d ' ' -f 1)
[[ "$before" == "$after" ]]
echo 'offline formula updater checks passed'
