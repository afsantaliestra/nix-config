{
  description = "Multi-system configuration with NixOS and Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # NixOS - 25.05
    nixpkgs-25-05.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager-25-05 = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs-25-05";
    };
    # NixOS - 24.11
    nixpkgs-24-11.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager-24-11 = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-24-11";
    };
    # NixOS WSL - 24.11
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs-24-11";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-25-05,
    home-manager-25-05,
    nixpkgs-24-11,
    home-manager-24-11,
    nixos-wsl,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";

    pkgs-25-05 = import nixpkgs-25-05 {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

    userConfig = import ./config.nix;

    homeConfigurations = {
      "debian" = home-manager-25-05.lib.homeManagerConfiguration {
        pkgs = pkgs-25-05;

        extraSpecialArgs = {
          inherit inputs;
          inherit outputs;
        };

        modules = [
          ./home/debian-wsl.nix
        ];
      };
    };
  };
}
