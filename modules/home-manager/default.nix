{
  config,
  pkgs,
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
      uv
      jq
      yq
      vim
      dig
      dive
      ctop
      lazydocker
      alejandra
      unstable.claude-code
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
    helix.enable = true;
  };

  imports = [
    ./options.nix
    ./git
    ./zsh
    ./desktop.nix
  ];
}
