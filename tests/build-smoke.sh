#!/usr/bin/env bash
# Test output-directory setup without requiring TeX or fonts.
set -euo pipefail
root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
work="$(mktemp -d)"
trap 'rm -rf -- "$work"' EXIT
mkdir -p "$work/bin" "$work/project"
cp "$root/build.sh" "$work/project/build.sh"

cat > "$work/bin/xelatex" <<'MOCK'
#!/usr/bin/env bash
set -euo pipefail
output="${1#--output-directory=}"
[[ "$output" != "$1" && -d "$output" ]]
printf 'xelatex %s\n' "$2" >> "$BUILD_SMOKE_LOG"
touch "$output/$2.aux"
MOCK
cat > "$work/bin/bibtex" <<'MOCK'
#!/usr/bin/env bash
set -euo pipefail
[[ -f "$1.aux" ]]
printf 'bibtex %s\n' "$1" >> "$BUILD_SMOKE_LOG"
MOCK
chmod +x "$work/bin/xelatex" "$work/bin/bibtex"
export PATH="$work/bin:$PATH"
export BUILD_SMOKE_LOG="$work/calls.log"
cd "$work/project"

# Fresh clone: no Tmp directory exists yet.
[[ ! -e Tmp ]]
bash build.sh a
[[ -d Tmp && -f Tmp/Thesis.aux ]]
[[ "$(grep -c '^xelatex ' "$BUILD_SMOKE_LOG")" == 3 ]]
[[ "$(grep -c '^bibtex ' "$BUILD_SMOKE_LOG")" == 1 ]]

# Repeated builds must not fail because the directory already exists.
bash build.sh a
[[ "$(grep -c '^xelatex ' "$BUILD_SMOKE_LOG")" == 6 ]]
[[ "$(grep -c '^bibtex ' "$BUILD_SMOKE_LOG")" == 2 ]]

# The existing custom-document argument remains supported.
bash build.sh a Custom
[[ -f Tmp/Custom.aux ]]
grep -q '^bibtex Tmp/Custom$' "$BUILD_SMOKE_LOG"
printf 'build smoke tests passed\n'
