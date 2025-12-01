{config, ...}: {
  home = {
    username = "necros";
    homeDirectory = "/home/necros";

    sessionPath = [
      "/home/necros/.local/bin"
    ];
  };

  programs.git = {
    settings.user = {
      name = "";
      email = "";
    };
  };
}
