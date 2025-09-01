{
  config,
  pkgs,
  bundle,
  ...
}: {
  environment.systemPackages = with pkgs; [
    moonlight-qt
    obs-studio
  ];
  programs = {};
  services = {};
}
