{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  configs = import ../../config.nix;
in {
  environment.systemPackages = with pkgs; [
    sunshine
    claude-code
  ];

  programs = {
    nix-ld.enable = true;
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        AllowUsers = ["necros"];
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
