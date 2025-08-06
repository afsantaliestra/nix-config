{
  description = "Multi-system configuration with NixOS and Home Manager";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # 25.05
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
    inherit (self) outputs;
    system = "x86_64-linux";

    pkgs-25-05 = import nixpkgs-25-05 {
      inherit system;
      config.allowUnfree = true;
    };

    mkPythonShell = pythonPkg:
      import ./utils/python-shell.nix {
        pkgs = pkgs-25-05;
        inherit pythonPkg;
      };
  in {
    formatter.${system} = pkgs-25-05.alejandra;

    config = import ./config.nix;

    # NixOS 25.05
    nixosConfigurations = {
      "laia" = nixpkgs-25-05.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
          inherit outputs;
        };

        modules = [
          ./hosts/laia/configuration.nix
          home-manager-25-05.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = false;
            home-manager.users."${outputs.config.user.username}" = import ./home/nixos.nix;
            home-manager.extraSpecialArgs = {
              pkgs = pkgs-25-05;
              inherit inputs;
              inherit outputs;
            };
          }
        ];
      };
    };

    # Non-NixOS with Home Manager 25.05
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

    # Development Shells
    devShells.${system} = {
      default = pkgs-25-05.mkShell {
        packages = with pkgs-25-05; [
          gnumake
          uv
        ];

        shellHook = builtins.readFile ./utils/shells/default-shell.sh;
      };

      py312 = mkPythonShell pkgs-25-05.python312;
      py313 = mkPythonShell pkgs-25-05.python313;
      py314 = mkPythonShell pkgs-25-05.python314;
    };
  };
}
