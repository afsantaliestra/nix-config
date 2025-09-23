{
  config,
  pkgs,
  ...
}: {
  virtualisation = {
    containers.enable = true;
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
      daemon.settings = {
        registry-mirrors = [
          "https://mirror.gcr.io"
          "https://registry.docker-cn.com"
        ];
      };
    };
  };
  containers = {
    dev-env = {
      autoStart = true;
      privateNetwork = true;
      hostAddress = "192.168.100.10";
      localAddress = "192.168.100.11";
      config = import ./containers/dev;
    };
  };
}
