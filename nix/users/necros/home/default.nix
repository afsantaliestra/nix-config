{pkgs, ...}: {
  home = {
    stateVersion = "25.05";
    username = "necros";
    homeDirectory = "/home/necros";
  };

  imports = [
    ./packages.nix
    ../../_common
  ];
}
