{
  # GENERAL
  cls = "clear";

  # DOCKER
  dckclsv = "docker volume prune -f";
  dckclsn = "docker network rm $(docker network ls -q)";
  dckcls = "dckclsc; echo ''; dckclsi; echo ''; dckclsv; echo ''; dckclsn";
  dckclscp = "docker rm -f $(docker ps -a)";
  dckclsp = "docker rm -f $(docker ps -aq); echo ''; docker rmi -f $(docker images -q); echo ''; docker volume prune -af; echo ''; docker network rm $(docker network ls -q); echo ''; docker builder prune -af";

  dcks = "docker ps;echo ''; docker images;echo ''; docker volume ls;echo ''; docker network ls";
  dcksc = "docker ps";
  dcksi = "docker images";
  dcksv = "docker volume ls";

  dckr = "docker restart";
  dckl = "docker logs -f --tail=50";
  dck = "docker";

  # DOCKER-COMPOSE
  dc = "docker compose";

  # SSH CONNECTIONS
  # <alias> = "ssh <user>@<IP or domain>";
}
