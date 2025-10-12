{...}: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

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
    initContent = builtins.readFile ./init-content.sh;
  };
}
