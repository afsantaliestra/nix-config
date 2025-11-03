{config, ...}: {
  system = {
    enableWSL = true;
    enableNixLd = true;
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
    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
  };
}
