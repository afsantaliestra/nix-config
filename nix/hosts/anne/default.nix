{
  config,
  pkgs,
  bundle,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ../_common
    ../../modules/desktop
    ../../modules/development
  ];

  boot.initrd.luks.devices."luks-6a53f0a6-3f18-4d52-af97-821a1134159a".device = "/dev/disk/by-uuid/6a53f0a6-3f18-4d52-af97-821a1134159a";

  networking = {
    hostName = "anne";
    networkmanager.enable = true;
    firewall = {
      enable = true;
    };
  };
}
