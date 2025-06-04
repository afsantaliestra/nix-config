{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  programs.ssh = {
    enable = true;
  };
}
