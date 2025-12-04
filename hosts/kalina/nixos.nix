{
  config,
  pkgs,
  ...
}: let
  cfgSystem = config.system;
in {
  system = {
    hasDesktop = true;
    enableContainers = true;
    useBootLoader = true;
    trustedUsers = ["necros"];
  };

  system.stateVersion = "25.11";

  networking = {
    hostName = "kalina";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedUDPPorts = [
        41641 # Tailscale WireGuard
      ];
      allowPing = false;
    };
  };

  environment.systemPackages = with pkgs; [];

  services = {
    avahi.enable = false;
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
    # logind = {
    #   powerKey = "suspend";
    #   powerKeyLongPress = "poweroff";
    #   extraConfig = ''
    #     IdleAction=ignore
    #     IdleActionSec=0
    #   '';
    # };
  };

  imports = [
    ./hardware-configuration.nix
  ];
}
