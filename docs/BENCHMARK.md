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
| `../lint-staged.sh`       |  141.6 ± 1.1 |      140.4 |      143.9 |        1.00 |
| `lint-staged`             | 293.5 ± 16.3 |      274.6 |      327.1 | 2.07 ± 0.12 |
| `lefthook run pre-commit` | 198.4 ± 16.5 |      185.8 |      242.4 | 1.40 ± 0.12 |
