# `duplic8r` - My Personal Dotfiles, and a Little More
[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/)


## About
`duplic8r` is a comprehensive collection of my personal dotfiles and development
environment setup. It is primarily focused on setting up a modern command line
environment and development tools. The project is designed to be installed on
fresh Ubuntu-based distributions using Ansible for automated configuration
management.

> [!IMPORTANT]
> **Migration Notice**: The legacy shell-based install script (`bin/install`)
> has been deprecated in favor of Ansible playbooks for better maintainability and
> configurability. Please use the Ansible installation method below.

For more information about installation options see the
[detailed installation instructions](docs/INSTALL.md).


## Table of Contents
+ [Install](#install)
  + [Prerequisites](#prerequisites)
  + [Ansible Installation (Recommended)](#ansible-installation-recommended)
  + [Legacy Install Script (Deprecated)](#legacy-install-script-deprecated)
+ [After Install](#after-install)
+ [Test](#test)
+ [Contribute](#contribute)
+ [License](#license)


## Install
The project has migrated from shell scripts to Ansible for better configuration
management and maintainability.

### Prerequisites
Install basic system dependencies before running the Ansible playbooks:

```bash
install_duplic8r_dependencies() {
    _COMMANDS=(
        'apt update'
        '&& apt upgrade --yes --no-install-recommends'
        '&& apt install --yes --no-install-recommends ca-certificates curl openssl rsync wget git python3 python3-pip' 
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

### Ansible Installation (Recommended)
The modern way to install `duplic8r` using Ansible for automated configuration:

```bash
# Clone the repository
git clone https://github.com/axler8r/duplic8r.git
cd duplic8r

# Run the Ansible installation
cd ansible
chmod +x install.sh
./install.sh
```

For development installation:
```bash
git clone -b development https://github.com/axler8r/duplic8r.git
cd duplic8r/ansible
./install.sh
```

### Legacy Install Script (Deprecated)
> [!WARNING]
> The shell-based install script is **deprecated** and will be removed in a
> future release. Please migrate to the Ansible installation method above.

<details>
<summary>Legacy installation commands (click to expand)</summary>

To install the **stable** version using the legacy script:
```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/stable/bin/install | bash /dev/stdin  
```

To install the **development** version using the legacy script:
```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/stable/bin/install | bash -s /dev/stdin --development
```

To run the **development** version of the installer:
```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/development/bin/install | bash -s /dev/stdin --development
```
</details>


## After Install
After the Ansible playbooks have completed, you will need to log out and log
back in to see the changes take effect. Alternatively you can start `zsh` to see
most changes immediately.

To complete the installation of NeoVim plugins, run the following command:
```bash
nvim --headless +'PlugInstall --sync' +qall
```


## Test
For more information on testing, see the [detailed test](docs/TEST.md)
documentation.


## Contribute
Fork this repository, make changes, and submit a pull request.


## License
This is free and unencumbered public domain software. For more information, see
<http://unlicense.org/> or the accompanying UNLICENSE file.
