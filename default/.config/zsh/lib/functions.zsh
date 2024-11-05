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
    if [[ "$FILE" == *.md ]]; then
        mdcat "$FILE"
    else
        bat "$FILE"
    fi
}
