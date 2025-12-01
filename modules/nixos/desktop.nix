{
  pkgs,
  config,
  lib,
  ...
}: let
  cfgSystem = config.system;
in {
  config = lib.mkIf cfgSystem.hasDesktop {
    environment.systemPackages = with pkgs; [
      brave
      telegram-desktop
      discord
      moonlight-qt
      obs-studio
      unstable.obsidian
      unstable.vscodium
    ];

    programs = {
      firefox.enable = true;
    };

    services = {
      displayManager.gdm = {
        enable = true;
        autoSuspend = false;
      };
      desktopManager.gnome.enable = true;
      pulseaudio.enable = false;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    };

    security.rtkit.enable = true;
  };
}
