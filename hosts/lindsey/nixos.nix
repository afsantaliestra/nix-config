{config, ...}: {
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
      allowPing = false;
    };
  };
  programs.coolercontrol.enable = true;
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
