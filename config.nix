{
  user = {
    username = "";
    fullName = "";
    email = "";
  };
  hosts = {};
  services = {
    dnsmasq = {
      listenAddress = ["127.0.0.1"];
      dnsServers = ["1.1.1.1" "8.8.8.8"];
      address = [];
    };
  };
}
