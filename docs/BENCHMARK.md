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

| Command                   | Mean \[ms\] | Min \[ms\] | Max \[ms\] |    Relative |
| :------------------------ | ----------: | ---------: | ---------: | ----------: |
| `../lint-staged.sh`       |  37.7 ± 1.5 |       36.0 |       41.2 |        1.00 |
| `lint-staged`             | 184.9 ± 5.0 |      180.1 |      196.5 | 4.91 ± 0.24 |
| `lefthook run pre-commit` |  90.6 ± 0.8 |       89.7 |       91.9 | 2.40 ± 0.10 |
