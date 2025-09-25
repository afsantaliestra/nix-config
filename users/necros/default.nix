{pkgs, ...}: {
  users = {
    groups.necros.gid = 1000;
    users = {
      necros = {
        isNormalUser = true;
        uid = 1000;
        group = "necros";
        extraGroups = ["networkmanager" "wheel" "users" "docker"];
        shell = pkgs.zsh;
        # Zsh is installed with Home-Manager.
        ignoreShellProgramCheck = true;
      };
    };
  };

  nix.settings.trusted-users = ["necros"];
}
