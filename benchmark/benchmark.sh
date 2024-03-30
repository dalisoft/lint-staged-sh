#!/usr/bin/env bash
set -eu

# Exports for binaries access
export PATH="./node_modules/.bin:$PATH"

prepare() {
  git init
  git add -Af package.json result.md
}

run() {
  hyperfine --runs 10 --warmup 3 '../lint-staged.sh' 'lint-staged' --export-markdown "result.md" --show-output
}

cleanup() {
  git rm -f result.md --cached
  rm -rf .git
}

prepare
run
cleanup
