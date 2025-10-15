{
  config,
  lib,
  ...
}: {
  options.user = {
    username = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = "necros";
      description = lib.mdDoc ''
        User username.
      '';
    };
    name = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = lib.mdDoc ''
        User full name.
      '';
    };
    email = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = lib.mdDoc ''
        User email.
      '';
    };
    hasDesktop = lib.mkEnableOption "System has desktop or not.";
  };
}
