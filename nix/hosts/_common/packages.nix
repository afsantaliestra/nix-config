{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [];

  programs = {
    mtr.enable = true;
    firefox.enable = true;
  };

  services = {
    tailscale = {
      enable = true;
      useRoutingFeatures = "server";
      openFirewall = true;
    };
  };

  virtualisation = {
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
}
