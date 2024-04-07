# lint-staged-sh \[0.x\]

> Except bugs, errors and/or strange behavior

Zero-{dependency,config,install,file} single-file `lint-staged` `posix shell` script

List of contents:

- [Github repository](https://github.com/dalisoft/lint-staged-sh)
- **Getting Started**
- [Installation](./INSTALLATION.md)
- [Usage](./USAGE.md)
- [Benchmark](./BENCHMARK.md)

## Getting Started

Welcome to lint-staged-sh! This tool is designed to streamline your software release process, making it easier to manage versions, changelogs, and deployment. Whether you're working on a small project or a large enterprise application, lint-staged-sh is here to simplify your workflow.

### Prerequisites

Before you start using lint-staged-sh, make sure you have the following installed on your system:

- `posix sh` and `curl` with required dependencies

## Features

- Available on all **Unix** environments
- Zero config
- Zero dependencies
- Single file `posix shell` script
- No pre-install, just use
- Programming language agnostic

## Linter dependencies

Install as dependency or as a global dependency one, some or all of those linters to use them. `lint-staged-sh` detects smartly if it available

- [shellcheck](https://github.com/koalaman/shellcheck)
- [dprint](https://github.com/dprint/dprint) and [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2)
- [biome](https://github.com/biomejs/biome)
- [jsona](https://github.com/jsona/jsona) or [spectral](https://github.com/stoplightio/spectral)
- [htmlhint](https://github.com/htmlhint/HTMLHint)
- [stylelint](https://github.com/stylelint/stylelint)
- [prettier](https://github.com/prettier/prettier)
- [Dockerfilelint](https://github.com/replicatedhq/dockerfilelint)

### Limitations

- Available only in **Unix** environments (no Windows support yet)

## Similar projects

- [lint-staged](https://github.com/lint-staged/lint-staged)
- [lefthook](https://github.com/evilmartians/lefthook)
- [lint-emit-rs](https://crates.io/crates/lint-emit)
- [offstage-rs](https://crates.io/crates/offstage)

## License

GPL-3
