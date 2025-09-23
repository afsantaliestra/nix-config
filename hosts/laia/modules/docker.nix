{
  config,
  pkgs,
  ...
}: {
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      experimental = true;
      metrics-addr = "0.0.0.0:9323";
      log-level = "info";
      log-driver = "json-file";
      log-opts = {
        max-size = "10m";
        max-file = "3";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    dive
    ctop
    lazydocker
  ];
}
