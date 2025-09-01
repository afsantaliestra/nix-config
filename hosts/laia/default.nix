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
  };
}
