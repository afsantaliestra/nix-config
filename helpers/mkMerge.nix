{bundle}: let
  pkgs = bundle.inputs.nixpkgs-25-05;
in {
  mkMerge = pkgs.lib.lists.foldl' (
    a: b: pkgs.lib.attrsets.recursiveUpdate a b
  ) {};
}
