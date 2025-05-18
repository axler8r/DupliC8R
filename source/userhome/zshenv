# ENVIRONMENT VARIABLES AND EXPORTS
if [[ -x $(which python3) ]] {
    SITE_PACKAGE_HOME=$(python3 -m site --user-site)
    export SITE_PACKAGE_HOME
}


# PATH
typeset -aU path # prevent duplicates
path=(${HOME}/.local/bin $path)
path=(${HOME}/.asdf/shims $path)
path+=("${HOME}/".zsh/functions)


# FPATH
typeset -aU fpath # prevent duplicates
fpath=(${HOME}/.zsh/completions $fpath)


# MANPATH
