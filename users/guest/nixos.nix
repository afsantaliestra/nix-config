{pkgs, ...}: {
  users = {
    groups.guest.gid = 2000;
    users.guest = {
      isNormalUser = true;
      uid = 2000;
      group = "guest";
      extraGroups = ["users"];
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true; # Zsh is installed with Home-Manager.
    };
  };
}
