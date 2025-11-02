{config, ...}: let
  cfgUser = config.user;
in {
  user = {
    hasDesktop = true;
  };
}
