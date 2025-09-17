{
  config,
  pkgs,
  bundle,
  ...
}: let
  serviceConfigs = bundle.config.services;
in {
  environment.systemPackages = with pkgs; [
    sunshine
  ];
  programs = {};
  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
      };
      openFirewall = true;
    };
    dnsmasq = {
      enable = true;
      settings = {
        listen-address = serviceConfigs.dnsmasq.listenAddress;
        bind-interfaces = true;
        domain-needed = true;
        bogus-priv = true;
        stop-dns-rebind = true;
        server = serviceConfigs.dnsmasq.dnsServers;
        address = serviceConfigs.dnsmasq.address;
      };
    };
  };
}
