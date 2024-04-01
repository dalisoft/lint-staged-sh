# lint-staged-sh \[0.x\]

> Except bugs, errors and/or strange behavior

Zero-dependency, zero-config, zero-install, single-file `lint-staged` PoC `posix shell` script

List of contents:

- [Github repository](https://github.com/dalisoft/lint-staged-sh)
- [Getting Started](./GET_STARTED.md)
- [Installation](./INSTALLATION.md)
- [Usage](./USAGE.md)
- **Benchmark**

## Benchmark

> Please test yourself on your machine. These results on my machine **MacBook Pro 13" M1 16/512**

### Average library project

| Command                   | Mean \[ms\] | Min \[ms\] | Max \[ms\] |    Relative |
| :------------------------ | ----------: | ---------: | ---------: | ----------: |
| `../lint-staged.sh`       |  97.5 ± 1.1 |       96.4 |       99.4 |        1.00 |
| `lint-staged`             | 270.7 ± 7.7 |      263.5 |      286.3 | 2.78 ± 0.08 |
| `lefthook run pre-commit` | 205.6 ± 9.4 |      197.8 |      230.1 | 2.11 ± 0.10 |
