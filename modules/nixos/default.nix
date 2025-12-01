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

  environment.systemPackages = with pkgs; [];

  programs = {
    mtr.enable = true;
    nix-ld.enable = cfgSystem.enableNixLd;
  };

  services = {
    tailscale.package = "${pkgs.tailscale}";
  };

  # Enable CUPS to print documents. Web interface: http://localhost:631
  # printing.enable = true;

  imports = [
    ../options.nix
    ./common.nix
    ./desktop.nix
    ./virtualization.nix
    ./wsl.nix
    ./boot-loader.nix
    ./dns.nix
  ];
}
