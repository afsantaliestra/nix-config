{
  pkgs,
  pythonPkg,
}:
pkgs.mkShell {
  packages = [pkgs.uv pkgs.gnumake pythonPkg];

  shellHook = builtins.readFile ./shells/python-shell.sh;
}
