{
  config,
  pkgs,
  ...
}: {
  home = {
    stateVersion = "25.11";

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
      jq
      yq
      vim
      bat
      dig
      dive
      ctop
      lazydocker
      alejandra
      uv
      unstable.claude-code
      unstable.gemini-cli
      unstable.opencode
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
      mouse = true;
      terminal = "tmux-256color";
      baseIndex = 1;
      plugins = with pkgs.tmuxPlugins; [
        # cpu
        {
          plugin = resurrect;
          extraConfig = "set -g @resurrect-strategy-nvim 'session'";
        }
        {
          plugin = continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '1' # minutes
          '';
        }
      ];
    };
    helix.enable = true;
  };

  imports = [
    ../options.nix
    ./git.nix
    ./zsh
    ./desktop.nix
  ];
}
