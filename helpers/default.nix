{bundle}: {
  inherit (import ./mkMerge.nix {inherit bundle;}) mkMerge;
  inherit (import ./mkHome.nix {inherit bundle;}) mkHome;
  inherit (import ./mkNixos.nix {inherit bundle;}) mkNixos;
}
