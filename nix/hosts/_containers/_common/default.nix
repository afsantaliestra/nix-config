{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../../users/container
  ];

  system.stateVersion = "25.05";
  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    firewall.enable = false;
    useHostResolvConf = false;
    nameservers = ["8.8.8.8" "1.1.1.1"];
    defaultGateway = "192.168.100.10";
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
    };
  };
}
