# `duplic8r` - My Personal Dotfiles, and a Little More
[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/)


## About
`duplic8r` is a collection of my personal dotfiles and a little more. It is
designed to be installed on a fresh, Ubuntu-based distribution. It has an
unattended intall script, but can be installed manually as well. It is intened
to be installed as a regular user in a single user environment, but can be
installed as root as well.


## Table of Contents
<!-- Insert updated table of contents -->
- [About](#about)
- [Install](#install)
  - [Requirements](#requirements)
  - [Unattended install](#unattended-install)
  - [Manual install](#manual-install)
    - [Install required system packages](#install-required-system-packages)
    - [Install required python packages](#install-required-python-packages)
    - [Clone repository](#clone-repository)
    - [Link the configuration files](#link-the-configuration-files)
    - [Conrigure tmux Plugin Manager](#conrigure-tmux-plugin-manager)
    - [Clone ASDF repository](#clone-asdf-repository)
    - [Install ASDF plugins](#install-asdf-plugins)
    - [Install Vim Plug](#install-vim-plug)
    - [Make ZSH the default shell](#make-zsh-the-default-shell)
    - [Use ZSH](#use-zsh)
- [Contribute](#contribute)
- [License](#license)


## Install
Choose one of the following methods to install `duplic8r`.


### Requirements

> [!IMPORTANT]
> Unattended and manual install methods require `curl`.

> [!NOTE]
> `curl` depends on `ca-certificates` and `openssl` which may be missing from
> your initial setup. Install it before running the install script.
 

```bash
COMMANDS=(
    'apt update'
    '&& apt upgrade --yes --no-install-recommends'
    '&& apt install --yes --no-install-recommends ca-certificates openssl curl'
)
if [ $(id --user) -eq 0 ]; then
    echo ${COMMANDS[@]} | bash /dev/stdin
else
    echo ${COMMANDS[@]} | sudo --shell /dev/stdin
fi
unset COMMANDS
```


### Unattended Install
To install the **stable** version of `duplic8r`, run the following command.

```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/stable/bin/install | bash /dev/stdin  
```

To install the **development** version of `duplic8r`, run the following command.

```bash
curl --silent https://raw.githubusercontent.com/axler8r/duplic8r/development/bin/install | bash /dev/stdin
```


### Manual Install
Follow these stpes to install `duplic8r` manually.


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
unset APT_PACKAGES
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
unset PYTHON_PACKAGES
```


#### Clone Repository
```bash
git clone https://github.com/axler8r/duplic8r.git ~/.duplic8r
```


#### Back Up Existing Configuration Files
```bash
BACKUP=$(date +%Y%m%d%H%M%S)
FILES=(
    ~/.XCompose
    ~/.ctags
    ~/.dircolors
    ~/.gitcommit
    ~/.gitconfig
    ~/.gitignore
    ~/.taskrc
    ~/.tigrc
    ~/.tmux.conf
    ~/.tmux_extend.zsh
    ~/.zshalias
    ~/.zshenv
    ~/.zshfunction
    ~/.zshprompt
    ~/.zshrc
)
for file in ${FILES[@]}; do
    if [ -f $file ]; then
        mv $file $file.$BACKUP
    fi
done

DIRECTORIES=(
    ~/.config/bat
    ~/.config/devilspie2
    ~/.config/git-cliff
    ~/.config/julia
    ~/.config/kitty
    ~/.config/nvim
    ~/.config/powerline
    ~/.config/powershell
    ~/.config/taskwarrior
)
for directory in ${DIRECTORIES[@]}; do
    if [ -d $directory ]; then
        mv $directory $directory.$BACKUP
    fi
done
unset BACKUP FILES DIRECTORIES
```



#### Link the configuration files
```bash
if [ ! -d .config ]; then
    mkdir --parents ~/.config
fi

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
ln -s ~/.duplic8r/homedir/config/git-cliff ~/.config
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
unset ASDF_PLUGINS
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
unset FLAGS
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
