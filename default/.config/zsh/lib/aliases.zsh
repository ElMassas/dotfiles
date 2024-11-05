#!/usr/bin/env zsh

# syms/redirections
alias yless="jless --yaml"
alias vi='nvim'
alias vim='nvim'
alias ls='eza'
alias du='dust'
alias df='duf'
alias batp='bat -P'
alias manner='tldr'
alias ping='gping'
alias ps='procs'
alias curl='curlie'


# OSINT
alias sherlock='python3 ~/Desktop/personal/OSINT/sherlock/sherlock'
alias spiderfoot='python3 ~/Desktop/personal/OSINT/spiderfoot-4.0/sf.py -l 127.0.0.1:5001'
alias photon='python3 ~/Desktop/personal/OSINT/Photon/photon.py'
alias domain_analyzer='python3 ~/Desktop/personal/OSINT/domain_analyzer/domain_analyzer.py'
alias final_recon='python3 ~/Desktop/personal/OSINT/FinalRecon/finalrecon.py'
alias harvester='python3 ~/Desktop/personal/OSINT/theHarvester/theHarvester.py'
alias recong-ng='.~/Desktop/personal/OSINT/recon-ng/recon-ng'
alias twistcli='~/.twistcli/twistcli'

# Containers
alias docker_clean='docker rm -f $(docker ps -a -q)'
alias docker_imc='docker rmi $(docker images -q)'
alias podman_clean='podman rm -f -i -v $(podman ps -a -q)'


# Dev
alias uvicorn_app='uvicorn app.app:app --host 0.0.0.0 --port 80 --reload --no-use-colors --no-access-log --log-level debug'
alias kafka_consumer='~/.kafka/kafka_2.13-3.7.0/bin/kafka-consumer-groups.sh'
alias gblame='git blame -w -C -C -C'
alias gms='git maintenance start'
alias lg='lazygit'
alias llama3='ollama -c $XDG_CONFIG_HOME/.llama/config.json'

# Kitten
alias diff="kitten diff"
alias icat="kitten icat"
alias clipboard="kitten clipboard"

# Git
alias onefetcher='onefetch -E --include-hidden --nerd-fonts'
