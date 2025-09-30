{pkgs, ...}: {
  users = {
    groups.casa.gid = 1050;
    users = {
      casa = {
        isNormalUser = true;
        uid = 1050;
        group = "casa";
        extraGroups = ["users"];
        shell = pkgs.zsh;
        # Zsh is installed with Home-Manager.
        ignoreShellProgramCheck = true;
      };
    };
  };

  nix.settings.trusted-users = ["casa"];
}
