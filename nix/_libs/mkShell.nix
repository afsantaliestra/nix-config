{pkgs, ...}: {
  mkShell = args @ {
    shell-name,
    system ? "x86_64-linux",
    extraPackages ? [],
  }: {
    devShells.${system}.${shell-name} = pkgs.mkShell {
      packages = [] ++ extraPackages;

      shellHook = builtins.readFile ./shell-hooks/${shell-name}.sh;
    };
  };
}
