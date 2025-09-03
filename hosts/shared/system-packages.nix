{
  config,
  pkgs,
  bundle,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
      brave
      discord
      moonlight-qt
      sunshine
    ]
    ++ [
      bundle.pkgs-unstable.telegram-desktop
      bundle.pkgs-unstable.obsidian
    ];
  programs = {
    mtr.enable = true;
    nix-ld.enable = true;
  };
  services = {
    tailscale.enable = true;
  };
}
