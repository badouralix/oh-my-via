# ZUnit Run Action

This little action brings unit testing in with <https://github.com/zunit-zsh/zunit>.

It effectively relies on <https://hub.docker.com/r/badouralix/zunit> to run the tests.

- [Usage](#usage)
- [Example](#example)

## Usage

Use it as a step in a job in a workflow. The minimal setup for it looks like this :

```yaml
jobs:
  zunit:
    name: zunit
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: zunit run
      uses: ./.github/actions/zunit-run
```

Test files or directories can be specified with

```yaml
      with:
        files-or-dirs: test-file-a test-file-b test-file-c
```

## Example

See usage example in [.github/workflows/ci.yaml](../../workflows/ci.yaml).
