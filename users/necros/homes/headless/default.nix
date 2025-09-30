{
  pkgs,
  inputs,
  ...
}: {
  home = {
    username = "necros";
    homeDirectory = "/home/necros";

    file = {};
    sessionVariables = {};

    packages = with pkgs; [
      uv
      jq
      yq
      vim
      dig
      dive
      ctop
      lazydocker
    ];
  };

  programs = {
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
    ../../../_common/homes/headless
    ../../../_modules/git
  ];
}
