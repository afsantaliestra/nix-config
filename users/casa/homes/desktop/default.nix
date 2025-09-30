{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    ../../../_common/homes/desktop
    ../headless
  ];
}
