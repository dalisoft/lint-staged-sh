#!/bin/sh
set -eu

# Exports for binaries access
export PATH="./node_modules/.bin:$PATH"

setup() {
  echo '{ "foo": "bar" }' >>tmp.json
  cp ../README.md ./README.md
  git init
  git add -A tmp.json
  git commit -m "initial commit"

  git add -Af package.json README.md
}

cleanup() {
  rm -rf .git tmp.json
}

# shellcheck disable=SC3045
export -f setup
# shellcheck disable=SC3045
export -f cleanup

hyperfine --runs 5 '../lint-staged.sh' 'lint-staged' 'lefthook run pre-commit' --export-markdown "result.md" --setup setup --cleanup cleanup
