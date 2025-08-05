{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  home = {
    stateVersion = "25.05";
    username = outputs.config.user.username;
    homeDirectory = "/home/${outputs.config.user.username}";

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
      cookiecutter
      cruft
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
    ./programs/git.nix
    ./programs/zsh.nix
  ];
}
