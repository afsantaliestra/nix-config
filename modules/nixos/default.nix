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
    nix-ld.enable = cfgSystem.enableNixLd;
  };

  imports = [
    ./options.nix
    ./wsl.nix
  ];
}
