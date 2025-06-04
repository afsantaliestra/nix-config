{
  pkgs,
  inputs,
  outputs,
  ...
}: {
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
    shellAliases = import ./shell/aliases.nix;
    initContent = builtins.readFile ./shell/init-content.sh;
  };
}
