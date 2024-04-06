# lint-staged-sh \[0.x\]

> Except bugs, errors and/or strange behavior

Zero-dependency, zero-config, zero-install, single-file `lint-staged` `posix shell` script

List of contents:

- [Github repository](https://github.com/dalisoft/lint-staged-sh)
- [Getting Started](./GET_STARTED.md)
- [Installation](./INSTALLATION.md)
- **Usage**
- [Benchmark](./BENCHMARK.md)

## Usage

This project can be used as you wish, local, remote, on CI and/or at VPS. Everywhere it works on same logic as you provide same credentials

### Requirements

See [Getting Started](./GET_STARTED.md) page if you didn't read

Below guide same as [Installation](./INSTALLATION.md#installation)

### First-time installation

```sh
curl -O https://raw.githubusercontent.com/dalisoft/lint-staged-sh/master/lint-staged.sh
chmod +x ./lint-staged.sh
```

### Husky integration

```sh
mv ./lint-staged.sh .husky/pre-commit
```

### Lefthook

```sh
mkdir -p .lefthook
mv ./lint-staged.sh .lefthook/pre-commit/lint-staged.sh
```

then add `.lefthook` folder to your `git` and add this to your `lefthook` configuration

```yml
pre-commit:
  scripts:
    "lint-staged.sh":
      runner: sh
```
