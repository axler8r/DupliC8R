#! /bin/sh

install_system_requirements() {
    apt update && apt upgrade --yes --no-install-recommends

    APT_PACKAGES=(
        devilspie2
        git
        git-flow
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
}


install_python_requirements() {
    pip3 install --upgrade pip

    PYTHON_PACKAGES=(
        powerline-status
        powerline-gitstatus
    )
    for package in $PYTHON_PACKAGES; do
        pip3 install --user $package
    done

}


install_duplic8r() {
    git clone https://github.com/axler8r/duplic8r.git ~/.duplic8r

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
}


configure_tmux_plugin_manager() {
    mkdir --parents ~/.tmux/plugins
    ln -s /usr/share/tmux-plugin-manager ~/.tmux/plugins/tpm
}


install_vim_plug() {
    curl \
        --fail \
        --location \
        --create-dirs \
        --output "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}


install_asdf() {
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1

    . ~/.asdf/asdf.sh

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
}


set_default_shell() {
    chsh -s $(which zsh) ${USER}
}


install() {
    install_system_requirements
    install_python_requirements
    install_duplic8r
    configure_tmux_plugin_manager
    install_vim_plug
    install_asdf
    set_default_shell
}


install
