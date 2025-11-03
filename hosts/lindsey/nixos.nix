{config, ...}: {
  system = {
    enableNixLd = true;
    enableRemote = true;
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
      allowPing = false;
    };
  };

  services = {
    avahi.enable = false;
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
  };

  imports = [
    ./hardware-configuration.nix
  ];
}
