{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    brave
    discord
    telegram-desktop
    obsidian
  ];
  programs = {
    mtr.enable = true;
    nix-ld.enable = true;
  };
  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
      };
      openFirewall = true;
    };
  };
  virtualisation.docker.enable = true;
}
