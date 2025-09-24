{pkgs, ...}: let
  configs = import ../../config.nix;
in {
  programs.git = {
    enable = true;
    userName = configs.user.fullName;
    userEmail = configs.user.email;
    extraConfig = {
      credential.helper = "store";
      push.autoSetupRemote = true;
      core = {
        editor = "nano";
        sshCommand = "${pkgs.openssh}/bin/ssh";
      };
    };
    ignores = [".DS_Store" "*.swp" "node_modules"];
  };
}
