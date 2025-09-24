{
  pkgs,
  inputs,
  ...
}: {
  home = {
    stateVersion = "25.05";
    username = "necros";
    homeDirectory = "/home/necros";
  };

  imports = [
    ../../_common
  ];
}
