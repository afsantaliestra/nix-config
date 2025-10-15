{
  config,
  lib,
  pkgs,
  ...
}: let
  cfgSystem = config.system;
in {
  config = lib.mkIf cfgSystem.enableRemote {
    networking = {
      networkmanager.enable = true;
      firewall = {
        enable = true;
        interfaces.wlp4s0 = {
          allowedTCPPorts = [
            22 # Ssh
          ];
          allowedUDPPorts = [
            41641 # Tailscale WireGuard uses this port.
          ];
        };
        interfaces.tailscale0 = {
          allowedTCPPorts = [
            80 # Http
            443 # Https
            47990 # Sunshine
          ];
          allowedUDPPorts = [
            47990 # Sunshine
          ];
        };
        allowPing = false;
      };
    };

    environment.systemPackages = with pkgs; [
      sunshine
    ];

    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
        KbdInteractiveAuthentication = false;
        AllowUsers = cfgSystem.trustedUsers;
      };
      openFirewall = false;
    };
  };
}
