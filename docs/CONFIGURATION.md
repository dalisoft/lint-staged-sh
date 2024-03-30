# lint-staged-sh \[0.x\]

> Except bugs, errors and/or strange behavior

Zero-dependency, zero-config, zero-install, single-file `lint-staged` PoC `bash` script

List of contents:

- [Github repository](https://github.com/dalisoft/lint-staged-sh)
- [Getting Started](./GET_STARTED.md)
- [Installation](./INSTALLATION.md)
- [Usage](./USAGE.md)
- **Configuration**
- [Benchmark](./BENCHMARK.md)

## Configuration

### GH Actions Configurations

See this project [workflow](../.github/workflows/lint_test_release.yml) or see below

> On **homepage** below content may show not properly, so, please check **workflow** file linked above

```yaml
name: Release
on:
  push:
    branches: [master]
  pull_request:
    branches: [master]

env:
  CI: true

jobs:
  release:
    runs-on: ubuntu-22.04
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0 # <-- This line is REQUIRED
          token: ${{ secrets.GH_TOKEN }} # <-- This line is REQUIRED too
      - name: Validate
        shell: bash
        run: |
          git clone https://github.com/dalisoft/lint-staged-sh.git --depth 1 .lint-staged-sh
          bash .lint-staged-sh/release.sh --plugins=git,github-release
```
