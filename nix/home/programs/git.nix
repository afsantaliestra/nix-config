{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = outputs.userConfig.user.fullName;
    userEmail = outputs.userConfig.user.email;
    extraConfig = {
      core = {
        editor = "nano";
        sshCommand = "${pkgs.openssh}/bin/ssh";
      };
    };
    ignores = [".DS_Store" "*.swp" "node_modules"];
  };
}
