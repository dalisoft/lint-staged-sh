# lint-staged-sh \[0.x\]

> Except bugs, errors and/or strange behavior

Zero-dependency, zero-config, zero-install, single-file `lint-staged` `posix shell` script

List of contents:

- [Github repository](https://github.com/dalisoft/lint-staged-sh)
- [Getting Started](./GET_STARTED.md)
- **Installation**
- [Usage](./USAGE.md)
- [Benchmark](./BENCHMARK.md)

## Installation

This project can be installed many ways but here we'll provide some ways

### First-time installation

```sh
curl -O https://raw.githubusercontent.com/dalisoft/lint-staged-sh/master/lint-staged.sh
chmod +x ./lint-staged.sh
./lint-staged.sh
```

## Linter dependencies

Install as dependency or as a global dependency one, some or all of those linters to use them. `lint-staged-sh` detects smartly if it available

- [shellcheck](https://github.com/koalaman/shellcheck)
- [dprint](https://github.com/dprint/dprint) or [markdownlint](https://github.com/DavidAnson/markdownlint)
- [biome](https://github.com/biomejs/biome)
- [jsona](https://github.com/jsona/jsona) or [spectral](https://github.com/stoplightio/spectral)
- [htmlhint](https://github.com/htmlhint/HTMLHint)
- [stylelint](https://github.com/stylelint/stylelint)
- [prettier](https://github.com/prettier/prettier)
- [Dockerfilelint](https://github.com/replicatedhq/dockerfilelint)

### Afterwards command

```sh
./lint-staged.sh
```
