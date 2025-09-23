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
      git-remote-gcrypt
      gnupg
      pinentry-curses
    ]
    ++ [
      bundle.pkgs-unstable.telegram-desktop
      bundle.pkgs-unstable.obsidian
    ];
  programs = {
    mtr.enable = true;
    nix-ld.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true; # Para usar GPG como agente SSH
      pinentryPackage = pkgs.pinentry-curses; # o "gtk2", "qt"
    };
  };
  services = {
    tailscale = {
      enable = true;
      useRoutingFeatures = "server";
      openFirewall = true;
    };
  };
}
