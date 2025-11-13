{
  config,
  lib,
  pkgs,
  ...
}: let
  cfgSystem = config.system;
in {
  config = lib.mkIf cfgSystem.enableWSL {
    wsl = {
      enable = true;
      defaultUser = "necros";
      useWindowsDriver = true;
      startMenuLaunchers = true;
      docker-desktop.enable = true;
      wslConf.automount.root = "/mnt";
    };
  };
}
