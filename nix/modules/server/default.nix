{pkgs, ...}: {
  environment.systemPackages = with pkgs; [];

  programs = {};

  services = {};

  virtualisation = {
    containers = {
      enable = true;
    };
  };
}
