# P10k insta prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Dirs for ZSH configs
zsh_dir=${${ZDOTDIR}:-$HOME/.config/zsh}


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
    colored-man-pages 
)

source ~/.config/oh-my-zsh/oh-my-zsh.sh
source ~/.config/zsh/.zshenv

ENABLE_CORRECTION="true"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source all ZSH config files (if present)
if [[ -d $zsh_dir ]]; then
  # Configure ZSH stuff
  source ${zsh_dir}/lib/aliases.zsh
  source ${zsh_dir}/lib/completions.zsh
  source ${zsh_dir}/lib/key_bindings.zsh
  source ${zsh_dir}/lib/functions.zsh
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

eval "$(zoxide init zsh)"
export PATH=/Users/massas/.local/bin:$PATH
