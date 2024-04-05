# lint-staged-sh \[0.x\]

> Except bugs, errors and/or strange behavior

Zero-dependency, zero-config, zero-install, single-file `lint-staged` `posix shell` script

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
| `../lint-staged.sh`       | 147.5 ± 14.1 |      138.5 |      172.4 |        1.00 |
| `lint-staged`             | 289.1 ± 15.7 |      275.7 |      307.1 | 1.96 ± 0.21 |
| `lefthook run pre-commit` | 190.4 ± 12.6 |      183.8 |      212.9 | 1.29 ± 0.15 |
