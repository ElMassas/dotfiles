set -xu

# P10k insta prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Dirs for ZSH configs
zsh_dir=${${ZDOTDIR}:-$HOME/.config/zsh}
utils_dir="${XDG_CONFIG_HOME}/utils"


# Oh-my-zsh configs
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    zsh-autosuggestions
    git
    aws
    docker-compose
    docker
    golang
    helm
    kubectl
    kubectx
    minikube
    nmap
    ripgrep
    colored-man-pages 
)

source ~/.config/oh-my-zsh/oh-my-zsh.sh

ENABLE_CORRECTION="true"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source all ZSH config files (if present)
if [[ -d $zsh_dir ]]; then
  # Configure ZSH stuff
  source ${zsh_dir}/lib/aliases.zsh
  source ${zsh_dir}/lib/history.zsh
  source ${zsh_dir}/lib/completions.zsh
  source ${zsh_dir}/lib/key_bindings.zsh
fi

# Import utility functions
if [[ -d $utils_dir ]]; then
  source ${utils_dir}/containers.zsh
fi

# Import P10k config for command prompt, run `p10k configure` or edit
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# MacOS-specific services
if [ "$(uname -s)" = "Darwin" ]; then
  # Add Brew to path, if it's installed
  if [[ -d /opt/homebrew/bin ]]; then
    export PATH=/opt/homebrew/bin:$PATH
  fi

fi

# If using Pyenv, import the shell integration if availible
#if [[ -d "$PYENV_ROOT" ]]; then
#  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#  eval "$(pyenv init -)"
#  eval "$(pyenv virtualenv-init -)"
#fi

# XDG directories
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_BIN_HOME="${HOME}/.local/bin"
export XDG_LIB_HOME="${HOME}/.local/lib"
export XDG_CACHE_HOME="${HOME}/.cache"

# Set default applications
export EDITOR="nvim"
export TERMINAL="xterm-256color"
export BROWSER="firefox"
export PAGER="less"

# Respect XDG directories
export OPENSSL_DIR="/usr/local/ssl"
export CURL_HOME="${XDG_CONFIG_HOME}/curl"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export GIT_CONFIG="${XDG_CONFIG_HOME}/git/.gitconfig"
export LESSHISTFILE="-" # Disable less history.
# export TMUX_PLUGIN_MANAGER_PATH="${XDG_DATA_HOME}/tmux/plugins"
# export NVIMINIT=":source $XDG_CONFIG_HOME/vim/vimrc"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export OHMYZSH="${XDG_CONFIG_HOME}/oh-my-zsh"
export PYENV_ROOT="$HOME/.virtualenvs"
export ZSH="${XDG_CONFIG_HOME}/oh-my-zsh"


#Ca-certs
export REQUESTS_CA_BUNDLE=${XDG_CONFIG_HOME}/cacert.pem

# General Path configs
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"


# Encodings, languges and misc settings
export LANG='en_GB.UTF-8';
export PYTHONIOENCODING='UTF-8';
export LC_ALL='C';

# Python configs
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)".