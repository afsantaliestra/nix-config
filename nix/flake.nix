{
  description = "Multi-system configuration with NixOS and Home Manager";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-25-05.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager-25-05 = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs-25-05";
    };
  };

  outputs = {
    self,
    nixpkgs-unstable,
    nixpkgs-25-05,
    home-manager-25-05,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs-25-05 {
      inherit system;
      config.allowUnfree = true;
    };
    lib = import ./_libs {
      inherit pkgs;
      nixpkgs = nixpkgs-25-05;
      home-manager = home-manager-25-05;
    };
    inherit (lib) mkMerge mkHome mkNixos mkShell;
  in
    mkMerge [
      {formatter.${system} = pkgs.alejandra;}
      (mkNixos {hostname = "laia";})
      (mkNixos {hostname = "anne";})
      (mkHome "debian" [])
      (mkShell {shell-name = "nix-config";})
      (mkShell {
        shell-name = "uv-env";
        extraPackages = [pkgs.uv];
      })
    ];
}
