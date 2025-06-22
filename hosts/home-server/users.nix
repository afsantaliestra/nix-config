{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${outputs.config.user.username}" = {
    isNormalUser = true;
    description = "${outputs.config.user.username}";
    extraGroups = ["networkmanager" "wheel" "docker"];
    packages = with pkgs; []; # Packages are managed with Home-Manager.
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true; # Zsh installed with Home-Manager.
  };
}
