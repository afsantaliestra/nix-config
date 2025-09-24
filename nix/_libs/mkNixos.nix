{inputs, ...}: let
  homeManagerCfg = args @ {
    username,
    homeExtraModules ? [],
    ...
  }: {
    home-manager.useGlobalPkgs = false;
    home-manager.useUserPackages = false;
    home-manager.backupFileExtension = "bak";
    home-manager.extraSpecialArgs = {};
    home-manager.users.${username}.imports = [
      ../users/${username}/home/desktop.nix
    ];
  };
in {
  mkNixos = args @ {
    hostname,
    username ? "necros",
    system ? "x86_64-linux",
    nixosExtraModules ? [],
    homeExtraModules ? [],
    ...
  }: {
    nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs;
      };

      modules = [
        ../hosts/${hostname}
        inputs.home-manager.nixosModules.home-manager
        (homeManagerCfg {
          homeExtraModules = homeExtraModules;
          username = username;
        })
      ];
    };
  };
}
