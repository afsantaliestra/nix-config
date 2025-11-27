{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
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
