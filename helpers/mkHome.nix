{bundle}: let
  home-manager-pkg = bundle.inputs.home-manager-25-05;
in {
  mkHome = homeName: homeExtraModules: {
    homeConfigurations.${homeName} = home-manager-pkg.lib.homeManagerConfiguration {
      pkgs = bundle.pkgs;

      extraSpecialArgs = {
        inherit bundle;
      };

      modules =
        [
          ../homes/debian-wsl.nix
        ]
        ++ homeExtraModules;
    };
  };
}
