{
  config,
  pkgs,
  ...
}: {
  services = {
    postgresql = {
      enable = true;
      package = pkgs.postgresql_15;
      authentication = ''
        local all all trust
        host all all 127.0.0.1/32 trust
      '';
    };
    redis.servers."" = {
      enable = true;
      port = 6379;
    };
    resolved.enable = true;
  };
}
