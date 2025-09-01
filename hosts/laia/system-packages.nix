{
  config,
  pkgs,
  bundle,
  ...
}: {
  environment.systemPackages = with pkgs; [];
  programs = {};
  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
      };
      openFirewall = true;
    };
  };
}
