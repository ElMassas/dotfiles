python_automata() {
    if [ "$1" = "-h" ]; then
        echo "Usage: python_automata <directory_name>"
        echo "This command will:"
        echo " - Perform some checks related to python using the following tools: bandit, ruff and osv-scanner."
    else
        for arg in "$@"; do
            bandit -r "$arg" && ruff check "$arg" && osv-scanner -i "$arg"
        done
    fi
}

bash_test() {
    podman run --platform linux/arm64 -it --rm ubuntu bash
}

postgres() {
    podman run --platform linux/arm64 -d --name postgres-test -e POSTGRES_PASSWORD='password' -e POSTGRES_DB=mytestdb -p 5432:5432 postgres
}

update_hosts() {
    sudo curl -o /etc/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts
    sudo dscacheutil -flushcache
    sudo killall -HUP mDNSResponder
}

vf() {
    local FILE="$1"
    if [[ "$FILE" == *.md || "$FILE" == *.markdown || "$FILE" == *.mdown || "$FILE" == *.mkd || "$FILE" == *.mkdn || "$FILE" == *.mdtxt || "$FILE" == *.mdtext ]]; then
        mdcat "$FILE"
    else
        cat "$FILE"
    fi
}

to_do() {
  docker-compose -f $HOME/Desktop/personal/to_do/docker-compose.yml up -d
}

connected_devices() {
  system_profiler SPUSBDataType
}

drawio() {
  podman run -it --rm --name="draw" -p 8080:9512 -p 8443:9514 jgraph/drawio
}

dns_cache_flush() {
  sudo dscacheutil -flushcache && \
  sudo killall -HUP mDNSResponder
}
