{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../shared.nix
    ../../modules/docker.nix
    ../../modules/dev-tools.nix
    ../../modules/services.nix
    ../../../../packages/nixos/zsh
  ];

  environment.variables = {
    NODE_ENV = "development";
    DEBUG = "true";
  };
}
