# `duplic8r` - My Personal Dotfiles, and a Little More
[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/)

## Table of Contents
+ [Install](#_install)
    + [Automatic Install](#_automatic-install)
    + [Manual Install](#_manual-install)
+ [Contribute](#_contribute)
+ [License](#_license)


## Install
Install required system packages.

> [!IMPORTANT]
> Both the automatic and manual install methods require `curl` to be installed.

```bash
apt update \
&& apt upgrade --yes --no-install-recommends \
&& apt install --yes --no-install-recommends curl
```


### Unattended Install
To install the _stable_ version of `duplic8r`, run the following command.

```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/stable/install.sh | bash
```

To install the _development_ version of `duplic8r`, run the following command.

```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/development/install.sh | bash
```


### Manual Install
Follow these stpes to install `duplic8r` manually.

- [`duplic8r` - My Personal Dotfiles, and a Little More](#duplic8r---my-personal-dotfiles-and-a-little-more)
  - [Table of Contents](#table-of-contents)
  - [Install](#install)
    - [Unattended Install](#unattended-install)
    - [Manual Install](#manual-install)
      - [Install Required System Packages](#install-required-system-packages)
      - [Install Required Python Packages](#install-required-python-packages)
      - [Clone Repository](#clone-repository)
      - [Link the configuration files](#link-the-configuration-files)
      - [Conrigure tmux Plugin Manager](#conrigure-tmux-plugin-manager)
      - [Clone ASDF Repository](#clone-asdf-repository)
      - [Install ASDF Plugins](#install-asdf-plugins)
      - [Install Vim Plug](#install-vim-plug)
      - [Make ZSH the Default Shell](#make-zsh-the-default-shell)
      - [Use ZSH](#use-zsh)
  - [Contribute](#contribute)
  - [License](#license)


#### Install Required System Packages
```bash
APT_PACKAGES=(
   devilspie2
   git
   git-flow
   less
   python3
   python3-pip
   taskwarrior
   tig
   tmux
   tmux-plugin-manager
   tree
   unzip
   zip
   zsh
   zsh-autosuggestions
   zsh-doc
   zsh-syntax-highlighting
)
apt install --no-install-recommends --yes ${APT_PACKAGES[@]}
```


#### Install Required Python Packages
```bash
pip3 install --upgrade pip
PYTHON_PACKAGES=(
   powerline-status
   powerline-gitstatus
)
for package in $PYTHON_PACKAGES; do
   pip3 install --user $package
done
```


#### Clone Repository
```bash
git clone https://github.com/axler8r/duplic8r.git ~/.duplic8r
```


#### Link the configuration files
```bash
ln -s ~/.duplic8r/homedir/XCompose ~/.XCompose
ln -s ~/.duplic8r/homedir/ctags ~/.ctags
ln -s ~/.duplic8r/homedir/dircolors ~/.dircolors
ln -s ~/.duplic8r/homedir/gitcommit ~/.gitcommit
ln -s ~/.duplic8r/homedir/gitconfig ~/.gitconfig
ln -s ~/.duplic8r/homedir/gitignore ~/.gitignore
ln -s ~/.duplic8r/homedir/taskrc ~/.taskrc
ln -s ~/.duplic8r/homedir/tigrc ~/.tigrc
ln -s ~/.duplic8r/homedir/tmux ~/.tmux.conf
ln -s ~/.duplic8r/homedir/tmux_extend.zsh ~/.tmux_extend.zsh
ln -s ~/.duplic8r/homedir/zshalias ~/.zshalias
ln -s ~/.duplic8r/homedir/zshenv ~/.zshenv
ln -s ~/.duplic8r/homedir/zshfunction ~/.zshfunction
ln -s ~/.duplic8r/homedir/zshprompt ~/.zshprompt
ln -s ~/.duplic8r/homedir/zshrc ~/.zshrc
ln -s ~/.duplic8r/homedir/config/bat ~/.config
ln -s ~/.duplic8r/homedir/config/devilspie2 ~/.config
ln -s ~/.duplic8r/homedir/config/julia ~/.config
ln -s ~/.duplic8r/homedir/config/kitty ~/.config
ln -s ~/.duplic8r/homedir/config/nvim ~/.config
ln -s ~/.duplic8r/homedir/config/powerline ~/.config
ln -s ~/.duplic8r/homedir/config/powershell ~/.config
ln -s ~/.duplic8r/homedir/config/taskwarrior ~/.config
```


#### Conrigure tmux Plugin Manager
```bash
mkdir --parents ~/.tmux/plugins
ln -s /usr/share/tmux-plugin-manager ~/.tmux/plugins/tpm
```


#### Clone ASDF Repository
```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
. ~/.asdf/asdf.sh
```


#### Install ASDF Plugins
```bash
ASDF_PLUGINS=(
    bat
    choose
    dive
    duf
    exa
    fd
    fzf
    github-cli
    htop
    jq
    just
    lsof
    neovim
    ripgrep
    strace
    tokei
    yq
)
for plugin in ${ASDF_PLUGINS[@]}; do
    echo "Installing $plugin"
    asdf plugin add $plugin
    asdf install $plugin latest
    asdf global $plugin $(asdf latest $plugin)
done
```


#### Install Vim Plug
```bash
FLAGS=(
    --create-dirs
    --fail
    --location
    --output
)
curl ${FLAGS[@]} "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```


#### Make ZSH the Default Shell
```bash
chsh --shell $(which zsh) ${USER}
```


#### Use ZSH
```bash
zsh
```


## Contribute
Fork this repository, make changes, and submit a pull request.


## License
This is free and unencumbered public domain software. For more
information, see <http://unlicense.org/> or the accompanying UNLICENSE
file.
