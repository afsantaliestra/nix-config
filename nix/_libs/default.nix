{
  pkgs,
  nixpkgs,
  home-manager,
  ...
}: {
  inherit (import ./mkMerge.nix {inherit pkgs nixpkgs home-manager;}) mkMerge;
  inherit (import ./mkHome.nix {inherit pkgs nixpkgs home-manager;}) mkHome;
  inherit (import ./mkNixos.nix {inherit pkgs nixpkgs home-manager;}) mkNixos;
  inherit (import ./mkShell.nix {inherit pkgs nixpkgs home-manager;}) mkShell;
}
