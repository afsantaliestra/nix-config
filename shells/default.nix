{bundle}: {
  mkShell = shellName: extraPackages: {
    devShells.${bundle.system}.${shellName} = bundle.pkgs.mkShell {
      packages = [] ++ extraPackages;

      shellHook = builtins.readFile ./hooks/${shellName}.sh;
    };
  };

  mkPythonShell = shellName: pythonPkg: {
    devShells.${bundle.system}.${shellName} = bundle.pkgs.mkShell {
      packages = [
        bundle.pkgs.uv
        bundle.pkgs.gnumake
        pythonPkg
      ];

      shellHook = builtins.readFile ./hooks/python.sh;
    };
  };
}
