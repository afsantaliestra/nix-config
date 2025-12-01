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
    enableDns = true;
    hasDesktop = true;
    useBootLoader = true;
    trustedUsers = ["necros"];
  };

  networking = {
    hostName = "laia";
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
      settings.Login = {
        IdleAction = "ignore";
        IdleActionSec = 0;
        HandlePowerKey = "suspend";
        HandlePowerKeyLongPress = "poweroff";
      };
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
    cron = {
      enable = true;
      systemCronJobs = [
        "@reboot root /home/necros/workspace/nix-config/hosts/laia/reboot-script.sh"
      ];
    };
  };

  imports = [
    ./hardware-configuration.nix
  ];
}
