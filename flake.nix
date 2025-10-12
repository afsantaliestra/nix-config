{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = {
    self,
    nixpkgs,
    nixos-wsl,
    ...
  }: let
    defaultUser = "necros";
    helpers = import ./helpers {
      inherit self defaultUser;
    };
  in {
    nixosModules.default = import ./modules/nixos;
    homeManagerModules.default = import ./modules/home-manager;

    nixosConfigurations = {
      wsl = helpers.mkNixos {
        hostname = "wsl";
        extraUsers = [];
      };
    };
  };
}
