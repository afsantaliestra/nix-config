{
  pkgs,
  config,
  lib,
  ...
}: let
  configs = import ../../config.nix;
in {
  environment.systemPackages = with pkgs; [
    sunshine
  ];

  programs = {
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
        local = "/${configs.services.dnsmasq.domain}/";
        domain = configs.services.dnsmasq.domain;
        listen-address = configs.services.dnsmasq.listenAddress;
        server = configs.services.dnsmasq.dnsServers;
        address = configs.services.dnsmasq.address;
      };
    };
  };
}
