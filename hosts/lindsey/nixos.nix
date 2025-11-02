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

  services = {
    avahi.enable = false;
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
    # Enable CUPS to print documents. Web interface: http://localhost:631
    # printing.enable = true;
  };

  imports = [
    ./hardware-configuration.nix
  ];
}
