{
  config,
  lib,
  pkgs,
  ...
}: let
  cfgSystem = config.system;
in {
  config = lib.mkIf cfgSystem.useBootLoader {
    boot.loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
