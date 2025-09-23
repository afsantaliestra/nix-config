{
  pkgs,
  bundle,
  ...
}: {
  imports = [
    ../../shared/zsh
  ];

  programs.zsh = {
    autosuggestion.enable = true;
    initContent = builtins.readFile ../../shared/zsh/init-content.sh;
  };
}
