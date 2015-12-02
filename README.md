BashVM - Bash Version Manager
=============================

BashVM is a command-line tool to easily install and manage multiple bash
versions in your local environment.

Requirements
------------

- Bash 3.2+
- Linux

Install
-------

Clone current project from  [GitHub](https://github.com/ueokande/bashvm) to `$HOME/.bashvm`,

```sh
git clone https://github.com/ueokande/bashvm $HOME/.bashvm
```

and add the following code,

```sh
source $HOME/.bashvm/bin/bashvm-init
```

into your `.bash_profile`

Usage
-----

### Lists bash versions

`list` sub-command with `local` option lists installed versions in your local:

```
bashvm list local
```

and with `remote` option lists available versions to install:

```
bashvm list remote
```

### Uses a bash version

`use` sub-command switches current bash version to version `X.Y`:

```
bashvm use X.Y
```

The `use` sub-command available for in current shell.
To switch default version, use `--default` option:

```
bashvm use X.Y --default
```

`system` target allows to use version installed in system (i.e. `bash` in
`/bin` or `/usr/bin`):

```
bashvm use system
```

If specified version is not installed in local but an available version to install,
use sub-command with `--install` installs and switches to the version.

```
bashvm use X.Y --install
```

### Installs a bash version

Use `install` sub-command

```
bashvm install X.Y
```

### More informations

Use `help` to display the helps of bashvm:

```
bashvm help
```

Licence
-------

MIT
