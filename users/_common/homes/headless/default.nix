{
  pkgs,
  inputs,
  ...
}: {
  home = {
    stateVersion = "25.05";

    file = {};
    sessionVariables = {};

    packages = with pkgs; [
      neofetch
      zip
      unzip
      gnumake
      gcc
      tree
      curl
      wget
      btop
      htop
      nano
    ];
  };

  programs = {
    home-manager.enable = true;
  };

  imports = [
    ../../../_modules/zsh
  ];
}
