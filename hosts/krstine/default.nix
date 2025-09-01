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

  boot.initrd.luks.devices."luks-6a53f0a6-3f18-4d52-af97-821a1134159a".device = "/dev/disk/by-uuid/6a53f0a6-3f18-4d52-af97-821a1134159a";

  networking = {
    # Define your hostname.
    hostName = "kristine";
  };
}
