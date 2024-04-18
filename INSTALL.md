# Install
More information about the `duplic8r` installer.

## Table of Contents
+ [Flags & Environment Variables](#flags-&-environment-variables)
    + [Examples](#examples)
+ [Test Environments](#test-environments)
+ [What is installed?](#what-is-installed?)


## Flags & Environment Variables
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
| `--development`  | `DEVELOPMENT`        | Install the development version of `duplic8r`. |
| `--in-container` | `IN_CONTAINER`       | Install `duplic8r` in a container.             |
| `--fonts`        | `FONTS`              | Install fonts.                                 |
| `--icons`        | `ICONS`              | Install icons.                                 |
| `--snaps`        | `SNAPS`              | Install `snap`s.                               |
| `--docker`       | `DOCKER`             | Install Docker Engine.                         |


### Examples
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


## Test Environments
The `test` directory contains a `Dockerfile` and the following scripts to facilitate testing.
+ `new-testimage` - Build a Docker image from the `Dockerfile`.
+ `remove-testimage` - Remove the test image.
+ `start-testcontainer` - Start a container from the test image.
+ `stop-testcontainer` - Stop the test container.


## What is installed?
The `duplic8r` installer will install the following packages and configurations
for Ubuntu Desktop and Server.
+ `apt` packages
  + `attr`
  + `build-essential`
  + `make-doc`
  + `bzip2`
  + `bzip2-doc`
  + `curl`
  + `devilspie2`
  + `git`
  + `git-flow`
  + `tig`
  + `htop`
  + `less`
  + `lsof`
  + `pv`
  + `python3`
  + `python3-pip`
  + `software-properties-common`
  + `strace`
  + `taskwarrior`
  + `tmux`
  + `tmux-plugin-manager`
  + `tree`
  + `universal-ctags`
  + `unzip`
  + `zip`
  + `zsh`
  + `zsh-autosuggestions`
  + `zsh-doc`
  + `zsh-syntax-highlighting`
+ `pip` packages
  + `pip`
  + `cliff`
  + `huggingface_hub[cli]`
  + `kaggle`
  + `powerline-gitstatus`
  + `powerline-status`
+ `dotfiles`
  + `.XCompose`
  + `.ctags`
  + `.dircolors`
  + `.gitcommit`
  + `.gitconfig`
  + `.gitignore`
  + `.taskrc`
  + `.tigrc`
  + `.tmux.conf`
  + `.tmux_extend.zsh`
  + `.zshalias`
  + `.zshenv`
  + `.zshfunction`
  + `.zshprompt`
  + `.zshrc`
+ `XDG_CONFIG_HOME` (`${HOME}/.config`) directories
  + `bat`
  + `devilspie2`
  + `julia`
  + `kitty`
  + `nvim`
+ `tmux-plugin-manager`
+ `asdf` with the following plugins
  + `bat`
  + `choose`
  + `dive`
  + `duf`
  + `exa`
  + `fd`
  + `fzf`
  + `github-cli`
  + `jq`
  + `just`
  + `neovim`
  + `nodejs`
  + `ripgrep`
  + `shellcheck`
  + `tokei`
  + `yq`
+ Vim `Plug`
+ `history-search-multi-word`
+ `z` move around
+ Kitty Terminal
+ GNU Parallel
+ Docker Engine
+ Fonts
  + Cascadia Code
  + Caskaydia Cove Nerd Font
+ Numix Square Icons
+ `snap`s
  + `brave`
  + `chromium`
  + `code --classic`
  + `obsidian --classic`
  + `slack`
  + `slides`

If the `IN_CONTAINER` environment variable is set, or the `--in-container`
command line flag is specified, the following packages are not installed by
default.
+ Docker Engine
+ Fonts
+ Numix Square Icons
+ `snap`s
