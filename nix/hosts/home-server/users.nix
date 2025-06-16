{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${outputs.userConfig.user.username}" = {
    isNormalUser = true;
    description = "${outputs.userConfig.user.username}";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true; # Zsh installed with Home-Manager.
  };
}
