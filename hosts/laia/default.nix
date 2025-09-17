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

  networking = {
    hostName = "laia";
    networkmanager.enable = true;
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
