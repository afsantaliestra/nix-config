{
  config,
  lib,
  ...
}: {
  options = {
    system = {
      enableWSL = lib.mkEnableOption "Enable WSL specific config.";
      enableNixLd = lib.mkEnableOption "Enable nix-ld program.";
      enableContainers = lib.mkEnableOption "Enable containers.";
      enableDns = lib.mkEnableOption "Enable dnsmasq service.";
      hasDesktop = lib.mkEnableOption "System has desktop or not.";
      useBootLoader = lib.mkEnableOption "System uses boot.loader or not.";
      trustedUsers = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        description = "Trusted users for nix settings.";
      };
    };
  };
}
