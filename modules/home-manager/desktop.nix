{
  pkgs,
  config,
  lib,
  ...
}: let
  cfgSystem = config.system;
in {
  config = lib.mkIf cfgSystem.hasDesktop {
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
        "org/gnome/desktop/input-sources" = {
          current = lib.hm.gvariant.mkUint32 0;
          sources = [(lib.hm.gvariant.mkTuple ["xkb" "es+deadtilde"])];
          xkb-options = [];
        };
        "org/gnome/settings-daemon/plugins/power" = {
          sleep-inactive-ac-type = "nothing";
        };
      };
    };

    programs = {
      alacritty = {
        enable = true;
        theme = "tokyo_night_storm";
        settings = {
          terminal.shell = {
            program = "tmux";
            args = ["new-session" "-A" "-s" "main"];
          };
        };
      };
      librewolf = {
        enable = true;
        languagePacks = ["en-US" "es"];
      };
    };
  };
}
