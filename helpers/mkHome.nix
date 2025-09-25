{
  pkgs,
  inputs,
  ...
}: {
  mkHome = homeName: homeExtraModules: {
    homeConfigurations.${homeName} = inputs.home-manager.lib.homeManagerConfiguration {
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
