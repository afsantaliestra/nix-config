{self, ...}: {
  pkgs-unstable-overlay = final: prev: {
    unstable = import self.inputs.nixpkgs-unstable {
      system = prev.system;
      config.allowUnfree = true;
    };
  };
}
