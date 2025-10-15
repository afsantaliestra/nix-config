{
  config,
  lib,
  pkgs,
  ...
}: let
  cfgSystem = config.system;
in {
  config = lib.mkIf cfgSystem.enableContainers {
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
  };
}
