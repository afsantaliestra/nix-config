{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nodejs_20
    python3
    python3Packages.pip
    go
    jq
    yq
    tree
    wget
    gnumake
    gcc
  ];
}
