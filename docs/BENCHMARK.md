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
| `../lint-staged.sh`       | 133.8 ± 7.0 |      126.7 |      146.9 |        1.00 |
| `lint-staged`             | 275.3 ± 6.7 |      271.4 |      294.1 | 2.06 ± 0.12 |
| `lefthook run pre-commit` | 185.0 ± 4.9 |      181.1 |      193.8 | 1.38 ± 0.08 |
