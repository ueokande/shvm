shvm - A Version Manager for Shells
===================================

Shvm is a command-line tool to easily install and manage multiple shell
versions in your local environment.

Requirements
------------

- A POSIX-compliant shells (i.e. dash, bash, or zsh)

Installation
------------

Clone a shvm to a directory `$HOME/.shvm` via [GitHub](https://github.com/ueokande/shvm):

```sh
git clone https://github.com/ueokande/shvm $HOME/.bashvm
```

and then, add the following code into your `.bash_profile`, `.zprofile`, or `.profile`:

```sh
[ -r $HOME/.shvm/profile ] && . $HOME/.shvm/profile
```

Usage
-----

### Basic usage

The below is an example, to install and use a certain shell version.

```sh
# List installable bash versions on remote repository
shvm list remote bash

# Install a certain shell
shvm install bash-2.0

# Set a $PATH to current shell to use the installed shell
shvm use bash-3.0

# List installed shells in a local disk
shvm list local

# Launch it
bash --version
```

### Use another shell versions

You can see another supported shells and use it like this

```sh
# List supported shells
shvm list support

# List installable fish versions
shvm list remote fish

# Install and use fish-2.0.0
shvm use  --install fish-2.0.0

# List installed shells in a local disk
shvm list local

# Launch it
fish --version
```

### More informations

Use `help` to display the helps of shvm:

```
shvm help
```

Licence
-------

MIT
