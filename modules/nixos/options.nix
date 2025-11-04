{
  config,
  lib,
  ...
}: {
  options = {
    users = {
      necros = {
        username = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = "necros";
          description = "User username.";
        };
      };
    };
    system = {
      enableWSL = lib.mkEnableOption "Enable WSL specific config.";
      enableNixLd = lib.mkEnableOption "Enable nix-ld program.";
      enableContainers = lib.mkEnableOption "Enable containers.";
      hasDesktop = lib.mkEnableOption "System has desktop or not.";
      trustedUsers = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = ["necros"];
        description = "Trusted users for nix settings.";
      };
    };
  };
}
