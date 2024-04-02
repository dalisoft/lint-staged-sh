#!/bin/sh
set -eu

# Exports for binaries access
export PATH="./node_modules/.bin:$PATH"

prepare() {
  echo '{ "foo": "bar" }' >>tmp.json
  git init
  git add -A tmp.json
  git commit -m "initial commit"
  git add -Af package.json result.md
}

cleanup() {
  git rm -f result.md --cached
  rm -rf .git tmp.json
}

# shellcheck disable=SC3045
export -f prepare
# shellcheck disable=SC3045
export -f cleanup

hyperfine --runs 10 --warmup 3 '../lint-staged.sh' 'lint-staged' 'lefthook run pre-commit' --export-markdown "result.md" --setup prepare --cleanup cleanup
