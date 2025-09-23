{
  pkgs,
  bundle,
  ...
}: {
  imports = [
    ../../shared/zsh
  ];

  programs.zsh = {
    autosuggestions.enable = true;
    shellInit = builtins.readFile ../../shared/zsh/init-content.sh;
  };
}
