# `duplic8r` - My Personal Dotfiles, and a Little More
[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/)


## About
`duplic8r` is a collection of my personal dotfiles and a little more. It is
designed to be installed on a fresh, Ubuntu-based distribution. It has an intall
script with a few options. It can be installed as a regular user in a single
user environment, but can be installed as root as well.


## Table of Contents
+ [Install](#install)
  + [Requirements](#requirements)
  + [Install Stable Version](#install-stable-version)
  + [Install Development Version](#install-development-version)
+ [Contribute](#contribute)
+ [License](#license)


## Install
Install is kept simple. The install script is a single command that can be
piped to `bash`.


### Requirements
> [!IMPORTANT]
> Install require `curl`.

> [!NOTE]
> `curl` depends on `ca-certificates` and `openssl` which may be missing from
> your initial setup. Install it before running the install script.

```bash
COMMANDS=(
    'apt update'
    '&& apt upgrade --yes --no-install-recommends'
    '&& apt install --yes --no-install-recommends ca-certificates openssl curl'
    '&& apt autoremove --yes'
    '&& apt autoclean'
)
if [ $(id --user) -eq 0 ]; then
    echo ${COMMANDS[@]} | bash --
else
    echo ${COMMANDS[@]} | sudo --shell --
fi
unset COMMANDS
```


### Install Stable Version
To install the **stable** version of `duplic8r`, run the following command.

```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/stable/bin/install | bash /dev/stdin  
```

### Install Development Version
To install the **development** version of `duplic8r`, run the following command.

```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/stable/bin/install | bash -s /dev/stdin --development
```

### Run the Development Installer
To run the **development** version of `install`, run the following command.
> [!NOTE]
> This will run the latest installer from the `development` branch.

> [!WARNING]
> The `development` version of the installer may not be stable.

```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/development/bin/install | bash -s /dev/stdin --development
```


## Contribute
Fork this repository, make changes, and submit a pull request.


## License
This is free and unencumbered public domain software. For more
information, see <http://unlicense.org/> or the accompanying UNLICENSE
file.
