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
    bundle = {
      inputs = inputs;
      outputs = self.outputs;
      system = "x86_64-linux";
      pkgs = import nixpkgs-25-05 {
        system = bundle.system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs-unstable {
        system = bundle.system;
        config.allowUnfree = true;
      };
      config = import ./config.nix;
      hostName = "";
    };

    inherit (import ./shells {inherit bundle;}) mkShell mkPythonShell;
    inherit (import ./helpers {inherit bundle;}) mkMerge mkHome mkNixos;
  in
    mkMerge [
      {formatter.${bundle.system} = bundle.pkgs.alejandra;}
      (mkNixos "laia" [] [])
      (mkNixos "kristine" [] [])
      (mkHome "debian" [])
      (mkShell "nix-config" [])
      (mkShell "uv-env" [bundle.pkgs.uv])
      (mkPythonShell "py312" bundle.pkgs.python312)
      (mkPythonShell "py313" bundle.pkgs.python313)
      (mkPythonShell "py314" bundle.pkgs.python314)
    ];
}
