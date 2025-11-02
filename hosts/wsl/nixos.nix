{config, ...}: {
  system = {
    enableWSL = true;
    enableNixLd = true;
  };

  services = {
    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
  };
}
