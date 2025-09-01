{
  pkgs,
  bundle,
  ...
}: let
  config = bundle.config;
in {
  home = {
    stateVersion = "25.05";
    username = config.user.username;
    homeDirectory = "/home/${config.user.username}";

    file = {};
    sessionVariables = {};

    packages = with pkgs; [
      neofetch
      openssh
      gnumake
      tree
      curl
      wget
      nano
      btop
      htop
      zip
      unzip
      jq
      dig
      # podman
      # ookiecutter
      # ruft
    ];

    # enableNixpkgsReleaseCheck = false;
  };

  programs = {
    home-manager.enable = true;
    ssh.enable = true;
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
    ../packages/git.nix
    ../packages/zsh
  ];
}
