set -e


local DUPLIC8R_PATH="~/.duplic8r/homedir"
local CONFIG_PATH="~/.config"


create_symlink() {
  ln --symbolic $1 $2
}


install_system_requirements() {
    local FLAGS=(
        --no-install-recommends
        --no-show-upgraded
        --quiet
        --yes
    )
    local APT_PACKAGES=(
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
    apt update && apt upgrade ${FLAGS[@]}
    apt install ${FLAGS[@]} ${APT_PACKAGES[@]}
}


install_python_requirements() {
    pip3 install --upgrade pip
    for package in powerline-status powerline-gitstatus; do
        pip3 install --user $package
    done
}


install_duplic8r() {

install_duplic8r() {
    git clone https://github.com/axler8r/duplic8r.git $DUPLIC8R_PATH

    create_symlink $DUPLIC8R_PATH/XCompose ~/.XCompose
    create_symlink $DUPLIC8R_PATH/ctags ~/.ctags
    create_symlink $DUPLIC8R_PATH/dircolors ~/.dircolors
    create_symlink $DUPLIC8R_PATH/gitcommit ~/.gitcommit
    create_symlink $DUPLIC8R_PATH/gitconfig ~/.gitconfig
    create_symlink $DUPLIC8R_PATH/gitignore ~/.gitignore
    create_symlink $DUPLIC8R_PATH/taskrc ~/.taskrc
    create_symlink $DUPLIC8R_PATH/tigrc ~/.tigrc
    create_symlink $DUPLIC8R_PATH/tmux ~/.tmux.conf
    create_symlink $DUPLIC8R_PATH/tmux_extend.zsh ~/.tmux_extend.zsh
    create_symlink $DUPLIC8R_PATH/zshalias ~/.zshalias
    create_symlink $DUPLIC8R_PATH/zshenv ~/.zshenv
    create_symlink $DUPLIC8R_PATH/zshfunction ~/.zshfunction
    create_symlink $DUPLIC8R_PATH/zshprompt ~/.zshprompt
    create_symlink $DUPLIC8R_PATH/zshrc ~/.zshrc
    create_symlink $CONFIG_PATH/bat $CONFIG_PATH
    create_symlink $CONFIG_PATH/devilspie2 $CONFIG_PATH
    create_symlink $CONFIG_PATH/julia $CONFIG_PATH
    create_symlink $CONFIG_PATH/kitty $CONFIG_PATH
    create_symlink $CONFIG_PATH/nvim $CONFIG_PATH
    create_symlink $CONFIG_PATH/powerline $CONFIG_PATH
    create_symlink $CONFIG_PATH/powershell $CONFIG_PATH
    create_symlink $CONFIG_PATH/taskwarrior $CONFIG_PATH
}


configure_tmux_plugin_manager() {
    mkdir --parents ~/.tmux/plugins
    ln --symbolic /usr/share/tmux-plugin-manager ~/.tmux/plugins/tpm
}


install_vim_plug() {
    local FLAGS=(
        --create-dirs
        --fail
        --location
        --output
    )
    curl ${FLAGS[@]} "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}


install_asdf() {
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
    . ~/.asdf/asdf.sh

    local ASDF_PLUGINS=(
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
}


set_default_shell() {
    chsh --shell $(which zsh) ${USER}
}


install() {
    if [ $(id --user) -eq 0 ]; then
        install_system_requirements
    else
        sudo install_system_requirements
    fi
    install_python_requirements
    install_duplic8r
    configure_tmux_plugin_manager
    install_vim_plug
    install_asdf
    set_default_shell
}


install
