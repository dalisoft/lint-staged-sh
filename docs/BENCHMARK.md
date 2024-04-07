# lint-staged-sh \[0.x\]

> Except bugs, errors and/or strange behavior

Zero-{dependency,config,install,file} single-file `lint-staged` `posix shell` script

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
| `../lint-staged.sh`       |  154.7 ± 5.8 |      149.5 |      166.6 |        1.00 |
| `lint-staged`             | 306.1 ± 13.0 |      295.5 |      339.5 | 1.98 ± 0.11 |
| `lefthook run pre-commit` |  201.4 ± 3.0 |      198.2 |      207.6 | 1.30 ± 0.05 |
