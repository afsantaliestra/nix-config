{
  pkgs,
  home-manager,
  ...
}: {
  mkHome = homeName: homeExtraModules: {
    homeConfigurations.${homeName} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = {};

      modules =
        [
          ../homes/debian-wsl.nix
        ]
        ++ homeExtraModules;
    };
  };
}
