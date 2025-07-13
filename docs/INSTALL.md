# Install
Installation guide for `duplic8r` - now using Ansible for better configuration
management.

> [!IMPORTANT]
> **Migration Notice**: `duplic8r` has migrated from shell scripts to Ansible
> playbooks for installation and configuration. The legacy shell-based installer
> (`bin/install`) is deprecated and will be removed in a future release.


## Table of Contents
+ [Ansible Installation (Recommended)](#ansible-installation-recommended)
  + [Prerequisites](#prerequisites)
  + [Basic Installation](#basic-installation)
  + [Development Installation](#development-installation)
  + [Ansible Configuration Options](#ansible-configuration-options)
+ [Legacy Shell Installer (Deprecated)](#legacy-shell-installer-deprecated)
  + [Flags & Environment Variables](#flags--environment-variables)
  + [Examples](#examples)
+ [What is installed?](#what-is-installed)


## Ansible Installation (Recommended)
The modern way to install and configure `duplic8r` using Ansible for automated,
reproducible setup.

### Prerequisites
Install basic system dependencies:

```bash
# Update system and install dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install -y ca-certificates curl git python3 python3-pip ansible
```

### Basic Installation
```bash
# Clone the repository
git clone https://github.com/axler8r/duplic8r.git
cd duplic8r

# Run Ansible installation
cd ansible
chmod +x install.sh
./install.sh
```

### Development Installation
```bash
# Clone development branch
git clone -b development https://github.com/axler8r/duplic8r.git
cd duplic8r/ansible

# Run development installation
./install.sh
```

### Ansible Configuration Options
The Ansible playbooks support various configuration options through inventory
variables. Common configurations include:

- **Desktop vs Server**: Automatically detected or can be specified
- **Container environments**: Special handling for containerized installations
- **Optional components**: Fonts, icons, snap packages, Docker Engine
- **Development tools**: Additional tools for development environments

For advanced configuration, edit the inventory files in `ansible/inventory/` or
pass extra variables to the playbook.


## Legacy Shell Installer (Deprecated)
> [!WARNING]
> The shell-based installer is **deprecated** and will be removed in a future
> release. Please migrate to the Ansible installation method above.

<details>
<summary>Legacy installer documentation (click to expand)</summary>

### Flags & Environment Variables

The `duplic8r` installer can be made aware of containerized Ubuntu environments
(like containers running on `dockerd`, `containerd` or `runc`). When installing
`duplic8r` in a container, the `IN_CONTAINER` environment variable should be set
or the `--in-container` command line flag should be specified. The installer
will not install Docker Engine, fonts, icons, or `snap`s in a container by
default. To install any of the aforementioned packages, set the appropriate
environment variable or specify the corresponding command line flag.

For instance to install Docker Engine in a container, set the `DOCKER`
environment variable or specify the `--docker` command line flag.

Command line flags take priority over environment variables.

| Flag             | Environment Variable | Description                                    |
|------------------|----------------------|------------------------------------------------|
| `--development`  | `DEVELOPMENT=true`   | Install the development version of `duplic8r`. |
| `--in-container` | `IN_CONTAINER=true`  | Install `duplic8r` in a container.             |
| `--trace`        | `TRACE=true`         | Log and print progress.                        |
| `--debug`        | `DEBUG=true`         | Log commands.                                  |
| `--test`         | `TEST=true`          | Perform a controlled test installation.        |
| `--snaps`        |                      | Install `snap`s when `--test`ing.              |
| `--fonts`        |                      | Install fonts when `--test`ing.                |
| `--fonts`        |                      | Install fonts when `--test`ing.                |
| `--kitty`        |                      | Install Kitty Terminal when `--test`ing.       |
| `--docker`       |                      | Install Docker Engine when `--test`ing.        |
| `--help`         |                      | Print help message.                            |

#### Examples
Install the development version of `duplic8r` in a container with environment
variables.
```bash
IN_CONTAINER=1 DEVELOPMENT=1 \
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/development/bin/install \
| bash -s /dev/stdin
```

Install the development version of `duplic8r` in a container with command line
flags.
```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/development/bin/install \
| bash -s /dev/stdin --in-container --development
```

Install the stable version of `duplic8r` in a container.
```bash
IN_CONTAINER=1 \
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/stable/bin/install \
| bash -s /dev/stdin
```

Install the development version of `duplic8r` with Docker Engine.
```bash
DOCKER=1 curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/development/bin/install \
| bash -s /dev/stdin
```

Install the development version of `duplic8r` with fonts, icons, `snap`s, and
Docker Engine.
```bash
FONTS=1 ICONS=1 SNAPS=1 DOCKER=1 \
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/development/bin/install \
| bash -s /dev/stdin
```

Install the stable version of `duplic8r` with fonts, icons, and `snap`s in a
container with flags.
```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/stable/bin/install \
| bash -s /dev/stdin --in-container --fonts --icons --snaps
```
</details>


## What is installed?
The Ansible playbooks install and configure the following components for Ubuntu
Desktop and Server environments:

### Core Packages
+ **APT packages**
  + `apt-file`
  + `attr`
  + `btop`
  + `build-essential`
  + `make-doc`
  + `bzip2`
  + `bzip2-doc`
  + `clamav`
  + `curl`
  + `fdupes`
  + `git`
  + `git-flow`
  + `git-lfs`
  + `tig`
  + `htop`
  + `less`
  + `lsof`
  + `mpv`
  + `ncdu`
  + `net-tools`
  + `nvtop`
  + `openssh-server`
  + `p7zip-full`
  + `plocate`
  + `powerline`
  + `powerline-gitstatus`
  + `pv`
  + `python3`
  + `python3-pip`
  + `python3-powerline`
  + `python3-powerline-gitstatus`
  + `rsync`
  + `socat`
  + `software-properties-common`
  + `stow`
  + `strace`
  + `tmux`
  + `tmux-plugin-manager`
  + `tree`
  + `universal-ctags`
  + `unzip`
  + `webp`
  + `wget`
  + `zip`
  + `zsh`
  + `zsh-autosuggestions`
  + `zsh-doc`
  + `zsh-syntax-highlighting`

+ **GUI packages** (optional)
  + `cheese`
  + `gnome-clocks`
  + `meld`

### Dotfiles and Configuration
Managed via GNU Stow, organized by category:
+ **System dotfiles**
  + `.XCompose`
  + `.ctags`
  + `.dircolors`
+ **Git configuration**
  + `.gitcommit`
  + `.gitconfig`
  + `.gitignore`
  + `.tigrc`
+ **Shell configuration**
  + `.zshalias`
  + `.zshenv`
  + `.zshprompt`
  + `.zshrc`
+ **Terminal configuration**
  + `.tmux.conf`
  + `.tmux_extend.zsh`

### XDG Config Directories
Configuration files in `${HOME}/.config`:
+ `bat/` - Bat syntax highlighter configuration
+ `Code/` - VS Code settings
+ `git-cliff/` - Git changelog configuration
+ `julia/` - Julia language configuration
+ `kitty/` - Kitty terminal configuration
+ `nvim/` - Neovim configuration
+ `powerline/` - Powerline prompt configuration
+ `powershell/` - PowerShell configuration

### Development Tools
+ **asdf version manager** with plugins:
  + `bat`
  + `choose`
  + `dive`
  + `eza` (modern `ls` replacement)
  + `fd`
  + `fzf`
  + `github-cli`
  + `jq`
  + `julia`
  + `neovim`
  + `ripgrep`
  + `tokei`
  + `yq`

### Optional Components
These are installed based on configuration or environment detection:

+ **Fonts** (when enabled)
  + Cascadia Code
  + Caskaydia Cove Nerd Font

+ **Desktop icons** (when enabled)
  + Numix Square Icons (Ubuntu 22.04)
  + Papirus Icon Theme (Ubuntu 24.04)

+ **Kitty Terminal** (when enabled)

+ **Docker Engine** (when enabled)

+ **Snap packages** (when enabled)
  + `brave`
  + `chromium`
  + `code --classic`
  + `gnome-boxes`
  + `obsidian --classic`
  + `slack`
  + `slides`

### Environment-Specific Behavior
When running in containerized environments, the Ansible playbooks automatically
detect this and skip certain components by default:
- Docker Engine
- Fonts  
- Desktop icons
- Snap packages

These can be explicitly enabled through Ansible variables if needed in container
environments.
