{config, ...}: {
  home = {
    username = "guest";
    homeDirectory = "/home/guest";

    sessionPath = [
      "/home/guest/.local/bin"
    ];
  };

  programs.git = {
    userName = "";
    userEmail = "";
  };
}
