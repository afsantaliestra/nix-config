{
  inputs,
  pkgs,
  ...
}: {
  inherit (import ./mkMerge.nix {inherit inputs;}) mkMerge;
  inherit (import ./mkHome.nix {inherit inputs pkgs;}) mkHome;
  inherit (import ./mkNixos.nix {inherit inputs;}) mkNixos;
  inherit (import ./mkShell.nix {inherit pkgs;}) mkShell;
}
