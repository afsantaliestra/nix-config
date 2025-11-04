{
  config,
  pkgs,
  ...
}: let
  cfgSystem = config.system;
in {
  system = {
    enableNixLd = true;
    enableContainers = true;
    hasDesktop = true;
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedUDPPorts = [
        41641 # Tailscale WireGuard
      ];
      interfaces.tailscale0 = {
        allowedTCPPorts = [
          22 # Ssh
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

  services = {
    avahi.enable = false;
    tailscale = {
      enable = true;
      useRoutingFeatures = "server";
    };
    logind = {
      powerKey = "suspend";
      powerKeyLongPress = "poweroff";
      extraConfig = ''
        IdleAction=ignore
        IdleActionSec=0
      '';
    };
    openssh = {
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

  imports = [
    ./hardware-configuration.nix
  ];
}
