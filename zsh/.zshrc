export ZSH="$HOME/.oh-my-zsh"

# Themes
ZSH_THEME="robbyrussell"

plugins=(zsh-autosuggestions
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
    tmux
)

source $ZSH/oh-my-zsh.sh

# Python configs
export WORKON_HOME=~/Envs
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/3.10/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/Library/Frameworks/Python.framework/Versions/3.10/bin/virtualenv
source /Library/Frameworks/Python.framework/Versions/3.10/bin/virtualenvwrapper.sh


# Aliases
alias python=/usr/bin/python3
alias pip=/Library/Frameworks/Python.framework/Versions/3.10/bin/pip3
alias sherlock='python3 ~/Desktop/personal/OSINT/sherlock/sherlock'
alias spiderfoot='python3 ~/Desktop/personal/OSINT/spiderfoot-4.0/sf.py -l 127.0.0.1:5001'
alias photon='python3 ~/Desktop/personal/OSINT/Photon/photon.py'
alias domain_analyzer='python3 ~/Desktop/personal/OSINT/domain_analyzer/domain_analyzer.py'
alias final_recon='python3 ~/Desktop/personal/OSINT/FinalRecon/finalrecon.py'
alias harvester='python3 ~/Desktop/personal/OSINT/theHarvester/theHarvester.py'
alias recong-ng='.~/Desktop/personal/OSINT/recon-ng/recon-ng'
alias docker_clean='docker rm -f $(docker ps -a -q)'
alias docker_imc='docker rmi $(docker images -q)'
alias yless="jless --yaml"
alias vi='nvim'
alias vim='nvim'
alias podman_clean='podman rm -f -i -v $(podman ps -a -q)'
# add func for postgres basic docker db

# Created by `pipx` on 2023-05-01 21:38:43
export PATH="$PATH:~/.local/bin"

#Ca-certs
export REQUESTS_CA_BUNDLE=$HOME/cacert.pem

# General Path configs
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export EDITOR="vim"

# History configs
# Configure history file.
HISTFILE="~/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

setopt extended_history       # Record timestamp of command in $HISTFILE.
setopt hist_expire_dups_first # Delete duplicates first when $HISTFILE size exceeds $HISTSIZE.
setopt hist_ignore_dups       # Ignore duplicated commands in history list.
setopt hist_find_no_dups      # Ignore duplicates when searching in history.
setopt hist_ignore_space      # Ignore commands that start with a space.
setopt hist_reduce_blanks     # Remove superfluous blanks from history items.
setopt hist_verify            # Show command with history expansion to user before running it.
setopt inc_append_history     # Add commands to $HISTFILE in order of execution.
setopt share_history          # Share history between different instances of the shell. 