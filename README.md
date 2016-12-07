shvm - A Version Manager for Shells
===================================

Shvm is a command-line tool to easily install and manage multiple shell
versions in your local environment.

Requirements
------------

- A shell which is compatibility with a POSIX sh (i.e. dash, bash, or zsh)
- Linux

Installation
------------

Clone a shvm to directory `$HOME/.shvm` via [GitHub](https://github.com/ueokande/shvm):

```sh
git clone https://github.com/ueokande/shvm $HOME/.bashvm
```

and then, add the following code into your `.bash_profile`, `.zprofile`, or `.profile`:

```sh
source $HOME/.shvm/bin/bashvm-init
```

Usage
-----

### Basics

The Below is an example, to install and use a certain shell version.

```sh
# List installable bash versions on remote repository
shvm list remote bash

# Install a certain shell
shvm install bash-2.0

# Set a $PATH to current shell to use the installed shell
shvm use bash-3.0

# List installed and default shells
shvm list bash-3.0

# Launch it
bash --version
```
### More informations

Use `help` to display the helps of shvm:

```
shvm help
```

Licence
-------

MIT
