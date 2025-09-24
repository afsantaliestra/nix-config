{nixpkgs, ...}: {
  mkMerge = nixpkgs.lib.lists.foldl' (
    a: b: nixpkgs.lib.attrsets.recursiveUpdate a b
  ) {};
}
