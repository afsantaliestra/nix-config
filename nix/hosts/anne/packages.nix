{
  config,
  pkgs,
  bundle,
  ...
}: {
  environment.systemPackages = with pkgs; [];
  programs = {};
  services = {};
}
