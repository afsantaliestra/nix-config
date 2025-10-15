{
  pkgs,
  config,
  lib,
  ...
}: let
  cfgUser = config.user;
in {
  config = lib.mkIf cfgUser.hasDesktop {
    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          accent-color = "purple";
        };
        "org/gnome/desktop/session" = {
          idle-delay = lib.hm.gvariant.mkUint32 300;
        };
        "org/gnome/desktop/notifications" = {
          show-in-lock-screen = false;
        };
        "org/gnome/desktop/peripherals/mouse" = {
          natural-scroll = false;
        };
        "org/gnome/settings-daemon/plugins/power" = {
          sleep-inactive-ac-type = "nothing";
        };
      };
    };
  };
}
