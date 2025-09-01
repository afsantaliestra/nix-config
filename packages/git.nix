{
  pkgs,
  bundle,
  ...
}: {
  programs.git = {
    enable = true;
    userName = bundle.config.user.fullName;
    userEmail = bundle.config.user.email;
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
