{
  pkgs,
  inputs,
  ...
}: {
  home = {
    username = "casa";
    homeDirectory = "/home/casa";

    file = {};
    sessionVariables = {};

    packages = with pkgs; [];
  };

  imports = [
    ../../../_common/homes/headless
  ];
}
