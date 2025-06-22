{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = outputs.config.user.fullName;
    userEmail = outputs.config.user.email;
    extraConfig = {
      core = {
        editor = "nano";
        sshCommand = "${pkgs.openssh}/bin/ssh";
      };
    };
    ignores = [".DS_Store" "*.swp" "node_modules"];
  };
}
