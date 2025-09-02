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
    moonlight-qt
    sunshine
  ];
  programs = {
    mtr.enable = true;
    nix-ld.enable = true;
  };
  services = {
    tailscale.enable = true;
  };
}
