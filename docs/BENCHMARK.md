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
| `../lint-staged.sh`       |  141.5 ± 2.2 |      138.9 |      144.8 |        1.00 |
| `lint-staged`             | 283.5 ± 13.8 |      274.7 |      308.0 | 2.00 ± 0.10 |
| `lefthook run pre-commit` |  187.7 ± 7.5 |      182.9 |      200.7 | 1.33 ± 0.06 |
