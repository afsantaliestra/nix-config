{
  # GENERAL
  cls = "clear";

  # DOCKER
  dck = "docker";
  dc = "docker compose";
  ## DOCKER - Management
  dckclsv = "docker volume prune -f";
  dckclsn = "docker network rm $(docker network ls -q)";
  dckcls = "dckclsc; echo ''; dckclsi; echo ''; dckclsv; echo ''; dckclsn";
  dckclscp = "docker rm -f $(docker ps -a)";
  dckclsp = "docker rm -f $(docker ps -aq); echo ''; docker rmi -f $(docker images -q); echo ''; docker volume prune -af; echo ''; docker network rm $(docker network ls -q); echo ''; docker builder prune -af";
  dckclss = "docker rm -f $(docker ps -aq); echo ''; docker volume prune -af; echo ''; docker network rm $(docker network ls -q)";
  ## DOCKER - Visualice
  dcks = "docker ps; echo ''; docker images; echo ''; docker volume ls; echo ''; docker network ls";
  dcksc = "docker ps";
  dckscm = "docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}'";
  dcksi = "docker images";
  dcksv = "docker volume ls";
  dcksn = "docker network ls";

  dckr = "docker restart";
  dckl = "docker logs -f --tail=50";

  # code = "codium";

  # SSH CONNECTIONS
  # <alias> = "ssh <user>@<IP or domain>";
}
