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
      git
      openssh
      gnumake
      tree
      curl
      wget
      nano
      htop
      zip
      unzip
      jq
      dig
      # podman
      cookiecutter
      cruft
    ];

    enableNixpkgsReleaseCheck = false;
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };
    home-manager.enable = true;
  };

  imports = [
    ./programs/git.nix
    ./programs/ssh.nix
    ./programs/tmux.nix
    ./programs/zsh.nix
  ];
}
