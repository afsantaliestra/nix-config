{
  pkgs,
  inputs,
  ...
}: {
  home = {
    stateVersion = "25.05";
    username = "container";
    homeDirectory = "/home/container";
  };

  imports = [
    ../../_common
  ];
}
