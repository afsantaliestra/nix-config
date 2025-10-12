{
  self,
  defaultUser,
  ...
}: let
  overlays = import "${self}/overlays" {inherit self;};

  mkNixosHomeManagerHome = {username}: {
    config,
    pkgs,
    ...
  }: {
    imports = [
      (self.outputs.homeManagerModules.default)
      "${self}/users/${username}/home.nix"
    ];
  };

  mkNixosHomeManager = {users}: {pkgs, ...}: {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      extraSpecialArgs = {};
      sharedModules = [];
      users = pkgs.lib.genAttrs users (username: mkNixosHomeManagerHome {inherit username;});
    };
  };

  mkNixosConfiguration = {
    hostname,
    users,
  }: {
    config,
    pkgs,
    ...
  }: {
    networking.hostName = hostname;
    imports =
      [
        self.outputs.nixosModules.default
        self.inputs.nixos-wsl.nixosModules.default
        "${self}/hosts/${hostname}"
      ]
      ++ (map (username: "${self}/users/${username}/nixos.nix") users);
  };
in {
  mkNixos = {
    hostname,
    extraUsers ? [],
    system ? "x86_64-linux",
  }: let
    users = [defaultUser] ++ extraUsers;

    pkgs = import self.inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [overlays.pkgs-unstable-overlay];
    };
  in
    self.inputs.nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      specialArgs = {};

      modules = [
        self.inputs.home-manager.nixosModules.home-manager
        (mkNixosHomeManager {inherit users;})
        (mkNixosConfiguration {inherit hostname users;})
      ];
    };
}
