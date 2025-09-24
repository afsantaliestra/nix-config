# Module: Development for NixOS Configuration.
# Modules that are needed in all NixOS that are going to be used for development.
# now: laia and katharina
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [];

  programs = {};

  services = {};
}
