{
  config,
  lib,
  pkgs,
  ...
}: let
  cfgUser = config.users.necros;
  cfgSystem = config.system;
in {
  config = lib.mkIf cfgSystem.enableWSL {
    wsl = {
      enable = true;
      docker-desktop.enable = true;
      wslConf.automount.root = "/mnt";
      defaultUser = cfgUser.username;
      startMenuLaunchers = true;
      useWindowsDriver = true;
    };
  };
}
