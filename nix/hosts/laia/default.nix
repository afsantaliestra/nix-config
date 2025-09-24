{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ../_common
    ../../modules/desktop
    ../../modules/development
    ../../modules/server
  ];

  networking = {
    hostName = "laia";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      # Note: Port 22 is open in all interfaces for both tcp/udp? by openssh service config.
      allowedTCPPorts = [53 80 443];
      allowedUDPPorts = [53];
      interfaces.tailscale0 = {
        allowedTCPPorts = [53 80 443];
        allowedUDPPorts = [53];
      };
      trustedInterfaces = ["docker0" "tailscale0"];
      extraCommands = ''
        iptables -A FORWARD -i ve-+ -j ACCEPT
        iptables -A FORWARD -o ve-+ -j ACCEPT
      '';
    };
    nat = {
      enable = true;
      internalInterfaces = ["ve-+"];
      externalInterface = "wlp4s0";
    };
  };
}
