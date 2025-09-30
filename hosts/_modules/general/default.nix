# Module: Common for NixOS Configuration.
# Modules that are needed in all NixOS not in Home Manager.
# now: kayleena and laia and katharina
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [];

  programs = {
    mtr.enable = true;
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
  };
}
