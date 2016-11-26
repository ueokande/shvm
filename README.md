shvm - A Version Manager for Shells
===================================

Shvm is a command-line tool to easily install and manage multiple bash
versions in your local environment.

Requirements
------------

- Bash 3.2+
- Linux

Install
-------

Clone current project from  [GitHub](https://github.com/ueokande/shvm) to `$HOME/.bashvm`,

```sh
git clone https://github.com/ueokande/shvm $HOME/.bashvm
```

and add the following code,

```sh
source $HOME/.shvm/bin/bashvm-init
```

into your `.bash_profile`

Usage
-----

### Lists bash versions

`list` sub-command with `local` option lists installed versions in your local:

```
shvm list local
```

and with `remote` option lists available versions to install:

```
shvm list remote
```

### Uses a bash version

`use` sub-command switches current bash version to version `X.Y`:

```
shvm use X.Y
```

The `use` sub-command available for in current shell.
To switch default version, use `--default` option:

```
shvm use X.Y --default
```

`system` target allows to use version installed in system (i.e. `bash` in
`/bin` or `/usr/bin`):

```
shvm use system
```

If specified version is not installed in local but an available version to install,
use sub-command with `--install` installs and switches to the version.

```
shvm use X.Y --install
```

### Installs a bash version

Use `install` sub-command

```
shvm install X.Y
```

### More informations

Use `help` to display the helps of shvm:

```
shvm help
```

Use in Travis-CI
----------------

The below example is to use shvm in Travis-CI.


```yaml
sudo: false
cache:
  directories:
  - .shvm/usr
env:
- RUN_BASH_VERSION=3.1
- RUN_BASH_VERSION=3.2
- RUN_BASH_VERSION=4.0
- RUN_BASH_VERSION=4.1
- RUN_BASH_VERSION=4.2
- RUN_BASH_VERSION=4.3
install:
- mkdir -p .shvm
- curl  https://codeload.github.com/ueokande/shvm/tar.gz/master | tar zx
- cp -r shvm-master/* .bashvm/
before_script:
- export SHVM_HOME=$(readlink -f  .shvm)
- source .shvm/bin/bashvm-init
- shvm use --install $RUN_BASH_VERSION
script:
- bash your_test_script.sh
```

This examples use container-based infrastructure to enable
[caching directories ]([https://docs.travis-ci.com/user/caching/) in order to reduce build time of bash versions.
In this example, `$TRAVIS_BUILD_DIR/.shvm/usr` directory which contains built bash versions is cached.
In `install` step, the archive of shvm is downloaded by curl instead of git-clone.
These commands allow to fetch the sources successfully under caching directories.

The build script run for each `RUN_BASH_VERSION` versions.
The bash version is installed and switched in `before_script`, and the switched version is enabled on `script`.

Licence
-------

MIT
