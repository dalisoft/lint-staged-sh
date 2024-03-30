# lint-staged-sh \[0.x\]

> Except bugs, errors and/or strange behavior

Zero-dependency, zero-config, zero-install, single-file `lint-staged` PoC `bash` script

List of contents:

- [Github repository](https://github.com/dalisoft/lint-staged-sh)
- [Getting Started](./GET_STARTED.md)
- [Installation](./INSTALLATION.md)
- [Usage](./USAGE.md)
- [Configuration](./CONFIGURATION.md)
- **Benchmark**

## Benchmark

> Please test yourself on your machine. These results on my machine **MacBook Pro 13" M1 16/512**

### Average library project

| Command             |  Mean \[ms\] | Min \[ms\] | Max \[ms\] |    Relative |
| :------------------ | -----------: | ---------: | ---------: | ----------: |
| `../lint-staged.sh` | 531.0 ± 55.0 |      485.7 |      637.3 |        1.00 |
| `lint-staged`       | 730.1 ± 24.1 |      698.8 |      772.2 | 1.38 ± 0.15 |
