{
  config,
  pkgs,
  bundle,
  ...
}: {
  environment.systemPackages = with pkgs; [
    obs-studio
  ];
  programs = {};
  services = {};
}
