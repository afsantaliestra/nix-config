{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-wsl,
    ...
  }: let
    helpers = import ./helpers {
      inherit self;
    };
  in {
    nixosModules.default = import ./modules/nixos;
    homeManagerModules.default = import ./modules/home-manager;

    nixosConfigurations = {
      wsl = helpers.mkNixos {
        hostname = "wsl";
      };
      laia = helpers.mkNixos {
        hostname = "laia";
      };
      kalina = helpers.mkNixos {
        hostname = "kalina";
      };
      lindsey = helpers.mkNixos {
        hostname = "lindsey";
      };
    };

    homeConfigurations = {
      debian = helpers.mkHomeManager;
    };
  };
}
