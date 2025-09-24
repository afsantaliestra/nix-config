{pkgs, ...}: {
  users = {
    groups.container.gid = 1000;
    users = {
      container = {
        isNormalUser = true;
        uid = 1000;
        group = "container";
        extraGroups = ["networkmanager" "wheel" "users" "docker"];
        shell = pkgs.zsh;
        # Zsh is installed with Home-Manager.
        ignoreShellProgramCheck = true;
      };
    };
  };

  nix.settings.trusted-users = ["container"];
}
