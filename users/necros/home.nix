{config, ...}: let
  cfgUser = config.user;
in {
  user = {
    name = "";
    email = "";
  };

  home = {
    username = cfgUser.username;
    homeDirectory = "/home/${cfgUser.username}";
  };
}
