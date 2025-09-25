{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./zsh
    ./git
  ];
}
