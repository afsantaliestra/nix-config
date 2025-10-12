{
  config,
  pkgs,
  ...
}: let
  cfgUser = config.user;
in {
  programs.git = {
    enable = true;
    userName = cfgUser.name;
    userEmail = cfgUser.email;
    extraConfig = {
      credential.helper = "store";
      push.autoSetupRemote = true;
      init = {
        defaultBranch = "master";
      };
      core = {
        editor = "nano";
        sshCommand = "${pkgs.openssh}/bin/ssh";
      };
    };
    ignores = [".DS_Store" "*.swp" "node_modules"];
  };
}
