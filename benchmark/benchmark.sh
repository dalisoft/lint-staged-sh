#!/usr/bin/env bash
set -eu

# Exports for binaries access
export PATH="./node_modules/.bin:$PATH"

prepare() {
  rm -rf tmp.json
  echo '{ "foo": "bar" }' >>tmp.json
  git init
  git add -A tmp.json
  git commit -m "initial commit"
  git add -Af package.json result.md
}

run() {
  hyperfine --runs 10 --warmup 3 '../lint-staged.sh' 'lint-staged' 'lefthook run pre-commit' --export-markdown "result.md"
}

cleanup() {
  git rm -f result.md --cached
  rm -rf .git tmp.json
}

prepare
run
cleanup
