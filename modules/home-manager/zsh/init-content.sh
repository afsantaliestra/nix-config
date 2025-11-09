bindkey '^H' backward-kill-word      # Ctrl+Backspace

function dcke() {
    docker exec -it "$1" /bin/bash
}

function dckrl() {
    docker restart "$1"; docker logs -f --tail=50 "$1"
}

function dckclsc() {
    docker rm -f $(docker ps -a --format "{{.ID}} {{.Names}}" | awk '{if ($2 !~ /python/) print $1}')
}

function dckclsi() {
    docker rmi -f $(docker images -a --format "{{.ID}} {{.Repository}}" | awk '{if ($2 !~ /python/) print $1}')
}

function dcknets() {
    docker ps -q | xargs -n 1 docker inspect --format '{{ .Name }} {{range .NetworkSettings.Networks}} {{.IPAddress}}{{end}}' | sed 's#^/##'
}

function start() {
    clear
    neofetch
    echo "=== Docker Containers        ==="
    docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"
    echo "=== End of Docker Containers ==="
}

start
eval "$(direnv hook zsh)"
