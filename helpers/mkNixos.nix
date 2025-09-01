{bundle}: let
  home-manager-pkg = bundle.inputs.home-manager-25-05;
  nixpkgs = bundle.inputs.nixpkgs-25-05;

  homeManagerCfg = homeExtraModules: {
    home-manager.useGlobalPkgs = false;
    home-manager.useUserPackages = false;
    home-manager.backupFileExtension = "bak";
    home-manager.extraSpecialArgs = {
      inherit bundle;
    };
    home-manager.users.${bundle.config.user.username}.imports =
      [
        ../homes/nixos.nix
      ]
      ++ homeExtraModules;
  };
in {
  mkNixos = hostName: nixosExtraModules: homeExtraModules: {
    nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
      system = bundle.system;

      specialArgs = {
        inherit bundle;
      };

      modules =
        [
          ../hosts/${hostName}
          (homeManagerCfg false [] ++ homeExtraModules)
        ]
        ++ nixosExtraModules;
    };
  };
}
