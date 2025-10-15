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
      unstable.brave
      unstable.telegram-desktop
      unstable.discord
      unstable.obsidian
      unstable.moonlight-qt
      unstable.vscodium
      unstable.obs-studio
    ];

    programs = {
      firefox.enable = true;
    };

    services = {
      xserver = {
        displayManager.gdm = {
          enable = true;
          autoSuspend = false;
        };
        desktopManager.gnome.enable = true;
      };
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
