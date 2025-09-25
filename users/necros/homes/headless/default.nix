{
  pkgs,
  inputs,
  ...
}: {
  home = {
    stateVersion = "25.05";
    username = "necros";
    homeDirectory = "/home/necros";

    file = {};
    sessionVariables = {};

    packages = with pkgs; [
      uv
      neofetch
      zip
      unzip
      gnumake
      gcc
      tree
      curl
      wget
      nano
      btop
      htop
      jq
      yq
      nano
      vim
      dig
      dive
      ctop
      lazydocker
    ];
  };

  programs = {
    home-manager.enable = true;
    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };
    tmux = {
      enable = true;
      extraConfig = "set-option -g mouse on";
    };
  };

  imports = [
    ../../../_modules
  ];
}
