{
  config,
  pkgs,
  bundle,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./system-packages.nix
    ../shared
  ];

  # Networking
  networking = {
    # Define your hostname.
    hostName = "laia";
    # Enable networking
    networkmanager.enable = true;
    # Firewall
    firewall = {
      enable = true;
      allowedTCPPorts = [
        80
      ];
      interfaces.tailscale0 = {
        allowedTCPPorts = [53 80 443];
        allowedUDPPorts = [53];
      };
    };
  };
}
