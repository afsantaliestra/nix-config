{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  programs.tmux = {
    enable = true;
    extraConfig = "set-option -g mouse on";
  };
}
