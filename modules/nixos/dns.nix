{
  # TODO
  config,
  lib,
  pkgs,
  ...
}: let
  cfgSystem = config.system;
in {
  config = lib.mkIf cfgSystem.enableDns {
    services = {
      dnsmasq = {
        enable = true;
        settings = {
          no-resolv = true;
          strict-order = true;
          bind-interfaces = true;
          domain-needed = true;
          bogus-priv = true;
          stop-dns-rebind = true;
          rebind-localhost-ok = true;
          no-hosts = true;
          dns-loop-detect = true;
          filterwin2k = true;
          filter-rr = ["ANY"];
          cache-size = 1000;
          expand-hosts = true;
          log-queries = "extra";
          log-facility = "/var/log/dnsmasq.log";
          interface = [""]; # TODO
          domain = "";
          listen-address = ["1.1.1.1"];
          server = ["1.1.1.1" "1.0.0.1"];
          local = "/xyz/";
          address = [
            "/xyz/1.1.1.1"
          ];
        };
      };
    };

    systemd.services.dnsmasq = {
      serviceConfig = {
        Restart = "on-failure";
        RestartSec = "5s";
      };
    };
  };
}
