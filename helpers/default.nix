{
  self,
  defaultUser ? "necros",
  system ? "x86_64-linux",
  ...
}: let
  overlays = import "${self}/overlays" {inherit self;};

  pkgs = import self.inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [overlays.pkgs-unstable-overlay];
  };

  mkNixosHomeManagerHome = {
    hostname,
    username,
  }: {
    config,
    pkgs,
    ...
  }: {
    imports = [
      (self.outputs.homeManagerModules.default)
      "${self}/hosts/${hostname}/home.nix"
      "${self}/users/${username}/home.nix"
    ];
  };

  mkNixosHomeManager = {
    hostname,
    users,
  }: {pkgs, ...}: {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      extraSpecialArgs = {};
      sharedModules = [];
      users = pkgs.lib.genAttrs users (username: mkNixosHomeManagerHome {inherit hostname username;});
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
        "${self}/hosts/${hostname}/nixos.nix"
      ]
      ++ (map (username: "${self}/users/${username}/nixos.nix") users);
  };
in {
  mkNixos = {
    hostname,
    extraUsers ? [],
  }: let
    users = [defaultUser] ++ extraUsers;
  in
    self.inputs.nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      specialArgs = {};

      modules = [
        self.inputs.home-manager.nixosModules.home-manager
        (mkNixosHomeManager {inherit hostname users;})
        (mkNixosConfiguration {inherit hostname users;})
      ];
    };

  mkHomeManager = self.inputs.home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    extraSpecialArgs = {};

    modules = [
      self.outputs.homeManagerModules.default
      "${self}/users/${defaultUser}/home.nix"
    ];
  };
}
