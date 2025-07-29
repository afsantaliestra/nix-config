{
  user = {
    username = abort "config.nix -> 'user.username' unset";
    fullName = abort "config.nix -> 'user.fullName' unset";
    email = abort "config.nix -> 'user.email' unset";
  };
  hosts = {
    "127.0.0.1" = ["local.server"];
  };
}
