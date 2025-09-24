{
  pkgs,
  config,
  lib,
  ...
}: {
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
      "org/gnome/settings-daemon/plugins/power" = {
        # sleep-inactive-ac-timeout = 1800;
        sleep-inactive-ac-type = "nothing";
      };
    };
  };

  imports = [
    ./default.nix
  ];
}
