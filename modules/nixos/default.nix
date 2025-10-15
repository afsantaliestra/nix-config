{
  config,
  pkgs,
  ...
}: let
  cfgSystem = config.system;
in {
  system.stateVersion = "25.05";
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = cfgSystem.trustedUsers;
  };

  programs = {
    mtr.enable = true;
    nix-ld.enable = cfgSystem.enableNixLd;
  };

  imports = [
    ./options.nix
    ./common.nix
    ./desktop.nix
    ./wsl.nix
    ./remote.nix
    ./virtualization.nix
  ];
}
