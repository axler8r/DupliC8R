# `duplic8r` - My Personal Dotfiles, and a Little More
[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/)


## About
`duplic8r` is a collection of my personal dotfiles and a little more. It is
primarily focussed on setting up my command line environment and tools I access
from the command line. It is designed to be installed on a fresh, Ubuntu-based
distribution. It has an intall script with a few options. It can be installed as
a regular user in a single user environment, but can be installed as root as
well.

For more information about the install script see the
[detailed installation instructions](documentation/INSTALL.md).


## Table of Contents
+ [Install](#install)
  + [Requirements](#requirements)
  + [Targets](#targets)
+ [Test](#test)
+ [Contribute](#contribute)
+ [License](#license)


## Install
Install is kept simple. The install script is a single command that can be piped
to `bash`.


### Requirements
Copy and paste the following code block into your terminal to install the
dependencies.

```bash
install_duplic8r_dependencies() {
    _COMMANDS=(
        'apt update'
        '&& apt upgrade --yes --no-install-recommends'
        '&& apt install --yes --no-install-recommends ca-certificates curl openssl rsync wget' 
        '&& apt autoremove --yes'
        '&& apt autoclean'
    )
    if [ $(id --user) -eq 0 ]; then
        echo ${_COMMANDS[@]} | bash --
    else
        echo ${_COMMANDS[@]} | sudo --shell --
    fi
    unset _COMMANDS
} && install_duplic8r_dependencies && unset -f install_duplic8r_dependencies
```


### Targets
To install the **stable** version of `duplic8r`, run the following command.
```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/stable/bin/install | bash /dev/stdin  
```

To install the **development** version of `duplic8r`, run the following command.
```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/stable/bin/install | bash -s /dev/stdin --development
```

To run the **development** version of `duplic8r`'s `install`er, and to install
the **development** version of `duplic8r` run the following command.
```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/development/bin/install | bash -s /dev/stdin --development
```

> [!NOTE]
> This will run the installer from the `development` branch, and install the
> `development` branch of `duplic8r`.

> [!WARNING]
> The `development` version of the installer may not be stable.


## Test
For more information on testing, see the [detailed test](documentation/TEST.md)
documentation.


## Contribute
Fork this repository, make changes, and submit a pull request.


## License
This is free and unencumbered public domain software. For more information, see
<http://unlicense.org/> or the accompanying UNLICENSE file.
