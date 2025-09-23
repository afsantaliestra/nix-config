{
  pkgs,
  bundle,
  ...
}: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "command-not-found"
        "git"
        "history"
      ];
    };
    shellAliases = import ./aliases.nix;
  };
}
