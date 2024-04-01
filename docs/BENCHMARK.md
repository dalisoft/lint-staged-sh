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

| Command                   |  Mean \[ms\] | Min \[ms\] | Max \[ms\] |    Relative |
| :------------------------ | -----------: | ---------: | ---------: | ----------: |
| `../lint-staged.sh`       | 482.1 ± 15.5 |      469.8 |      517.8 |        1.00 |
| `lint-staged`             | 581.2 ± 46.0 |      561.7 |      711.6 | 1.21 ± 0.10 |
| `lefthook run pre-commit` |  494.4 ± 7.5 |      485.5 |      512.7 | 1.03 ± 0.04 |
