{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  home = {
    stateVersion = "25.05";
    username = outputs.userConfig.user.username;
    homeDirectory = "/home/${outputs.userConfig.user.username}";
  };

  imports = [
    ./shared.nix
  ];
}
