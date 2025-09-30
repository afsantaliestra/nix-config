# Module: Desktop for NixOS Configuration.
# Modules that are needed in all NixOS with desktop. (now: laia and katharina)
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    brave
    telegram-desktop
    discord
    obsidian
    moonlight-qt
    vscodium
    obs-studio
  ];

  programs = {
    firefox.enable = true;
  };

  services = {};
}
