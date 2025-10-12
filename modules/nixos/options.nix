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
      trustedUsers = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = ["necros"];
        description = "Trusted users for nix settings.";
      };
    };
  };
}
