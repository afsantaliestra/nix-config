{
  config,
  pkgs,
  ...
}: let
  cfgUser = config.users.necros;
in {
  users = {
    groups."${cfgUser.username}".gid = 1000;
    users = {
      "${cfgUser.username}" = {
        isNormalUser = true;
        uid = 1000;
        group = cfgUser.username;
        extraGroups = ["users" "wheel" "networkmanager" "docker"];
        shell = pkgs.zsh;
        ignoreShellProgramCheck = true; # Zsh is installed with Home-Manager.
      };
    };
  };
}
