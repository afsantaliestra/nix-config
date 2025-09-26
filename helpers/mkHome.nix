{
  pkgs,
  inputs,
  ...
}: {
  mkHome = args @ {
    homename,
    username ? "necros",
    homeExtraModules ? [],
    ...
  }: {
    homeConfigurations.${homename} = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = {};

      modules =
        [
          ../users/${username}/homes/headless
        ]
        ++ homeExtraModules;
    };
  };
}
