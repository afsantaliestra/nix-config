{
  user = {
    username = "";
    fullName = "";
    email = "";
  };
  services = {
    dnsmasq = {
      listenAddress = ["127.0.0.1"];
      dnsServers = ["1.1.1.1" "8.8.8.8"];
      domain = "home.local";
      hostRecords = [];
    };
  };
}
