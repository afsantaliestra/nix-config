{
  description = "Multi-system configuration with NixOS and Home Manager";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs-unstable,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    helpers = import ./helpers {
      inherit inputs pkgs;
    };
    inherit (helpers) mkMerge mkHome mkNixos mkShell;
  in
    mkMerge [
      {formatter.${system} = pkgs.alejandra;}
      (mkNixos {hostname = "laia";})
      (mkNixos {hostname = "anne";})
      (mkHome {homename = "debian";})
      (mkShell {shell-name = "nix-config";})
      (mkShell {
        shell-name = "uv-env";
        extraPackages = [pkgs.uv];
      })
    ];
}
