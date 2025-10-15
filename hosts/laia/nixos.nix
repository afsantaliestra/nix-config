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
      useRoutingFeatures = "server";
    };
    # Enable CUPS to print documents. Web interface: http://localhost:631
    # printing.enable = true;
    logind = {
      powerKey = "suspend";
      powerKeyLongPress = "poweroff";
      extraConfig = ''
        IdleAction=ignore
        IdleActionSec=0
      '';
    };
  };

  imports = [
    ./hardware-configuration.nix
  ];
}
