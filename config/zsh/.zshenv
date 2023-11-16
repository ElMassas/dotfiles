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