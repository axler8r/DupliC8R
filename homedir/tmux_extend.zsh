#!/usr/bin/env zsh

local _TMUX_PLUGINS_HOME="${HOME}"/.tmux/plugins
local __DUPLIC8R_HOME="${PWD}"/../../

[[ ! -d "${_TMUX_PLUGINS_HOME}" ]] && mkdir -p -- "${_TMUX_PLUGINS_HOME}"
[[ -d "${__DUPLIC8R_HOME}" ]] && ln --symbolic "${__DUPLIC8R_HOME}"/deps/tmux-plugins-manager "${HOME}"/.tmux/plugins/tpm
