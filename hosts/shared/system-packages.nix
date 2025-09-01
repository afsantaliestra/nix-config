{
  config,
  pkgs,
  bundle,
  ...
}: {
  environment.systemPackages = with pkgs; [
    brave
    discord
    telegram-desktop
    obsidian
  ];
  programs = {
    mtr.enable = true;
    nix-ld.enable = true;
  };
  services = {};
}
