# XDG directories
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_BIN_HOME="${HOME}/.local/bin"
export XDG_LIB_HOME="${HOME}/.local/lib"
export XDG_CACHE_HOME="${HOME}/.cache"

# Set default applications
export EDITOR="nvim"
export TERMINAL="xterm-256color"

# Respect XDG directories
export OPENSSL_DIR="/usr/local/ssl"
export CURL_HOME="${XDG_CONFIG_HOME}/curl"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export GIT_CONFIG="${XDG_CONFIG_HOME}/git/.gitconfig"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export OHMYZSH="${XDG_CONFIG_HOME}/oh-my-zsh"
export ZSH="${XDG_CONFIG_HOME}/oh-my-zsh"

# Encodings, languges and misc settings
export LANG='en_GB.UTF-8';

export LC_ALL='C';
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

# Python
export PYTHONIOENCODING='UTF-8';

# Rust
. "$HOME/.cargo/env"

# golang
export GOPATH="/Users/massas/go"
export GOROOT="/usr/local/go"
export GO111MODULE=on  # Enable Go modules
export GOBIN=$GOPATH/bin

# PGP
export GPG_TTY=$(tty)