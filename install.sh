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
    git clone https://github.com/axler8r/duplic8r.git ~/.duplic8r

    ln --symbolic ~/.duplic8r/homedir/XCompose ~/.XCompose
    ln --symbolic ~/.duplic8r/homedir/ctags ~/.ctags
    ln --symbolic ~/.duplic8r/homedir/dircolors ~/.dircolors
    ln --symbolic ~/.duplic8r/homedir/gitcommit ~/.gitcommit
    ln --symbolic ~/.duplic8r/homedir/gitconfig ~/.gitconfig
    ln --symbolic ~/.duplic8r/homedir/gitignore ~/.gitignore
    ln --symbolic ~/.duplic8r/homedir/taskrc ~/.taskrc
    ln --symbolic ~/.duplic8r/homedir/tigrc ~/.tigrc
    ln --symbolic ~/.duplic8r/homedir/tmux ~/.tmux.conf
    ln --symbolic ~/.duplic8r/homedir/tmux_extend.zsh ~/.tmux_extend.zsh
    ln --symbolic ~/.duplic8r/homedir/zshalias ~/.zshalias
    ln --symbolic ~/.duplic8r/homedir/zshenv ~/.zshenv
    ln --symbolic ~/.duplic8r/homedir/zshfunction ~/.zshfunction
    ln --symbolic ~/.duplic8r/homedir/zshprompt ~/.zshprompt
    ln --symbolic ~/.duplic8r/homedir/zshrc ~/.zshrc
    ln --symbolic ~/.duplic8r/homedir/config/bat ~/.config
    ln --symbolic ~/.duplic8r/homedir/config/devilspie2 ~/.config
    ln --symbolic ~/.duplic8r/homedir/config/julia ~/.config
    ln --symbolic ~/.duplic8r/homedir/config/kitty ~/.config
    ln --symbolic ~/.duplic8r/homedir/config/nvim ~/.config
    ln --symbolic ~/.duplic8r/homedir/config/powerline ~/.config
    ln --symbolic ~/.duplic8r/homedir/config/powershell ~/.config
    ln --symbolic ~/.duplic8r/homedir/config/taskwarrior ~/.config
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
