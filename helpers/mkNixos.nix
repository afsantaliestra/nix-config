{
  inputs,
  pkgs,
  ...
}: let
  homeManagerCfg = users: {
    home-manager.useGlobalPkgs = false;
    home-manager.useUserPackages = false;
    home-manager.backupFileExtension = "bak";
    home-manager.extraSpecialArgs = {};
    home-manager.users = pkgs.lib.genAttrs users (username: {
      imports = [
        ../users/${username}/homes/desktop
      ];
    });
  };
in {
  mkNixos = args @ {
    hostname,
    system ? "x86_64-linux",
    hostModules ? [],
    extraUsers ? [],
    ...
  }: let
    users = ["necros"] ++ extraUsers;
  in {
    nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs;
      };

      modules =
        [
          ../hosts/${hostname}
          inputs.home-manager.nixosModules.home-manager
          (homeManagerCfg users)
        ]
        ++ (map (username: ../users/${username}) users)
        ++ hostModules;
    };
  };
}
