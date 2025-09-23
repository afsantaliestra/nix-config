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
        bind-interfaces = true;
        domain-needed = true;
        bogus-priv = true;
        stop-dns-rebind = true;
        no-hosts = true;
        cache-size = 1000;
        expand-hosts = true;
        log-queries = true;
        log-facility = "/var/log/dnsmasq.log";
        interface = "tailscale0";
        local = "/${serviceConfigs.dnsmasq.domain}/";
        domain = serviceConfigs.dnsmasq.domain;
        listen-address = serviceConfigs.dnsmasq.listenAddress;
        server = serviceConfigs.dnsmasq.dnsServers;
        address = serviceConfigs.dnsmasq.address;
      };
    };
  };
}
