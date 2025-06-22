{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    brave
    ollama
  ];
  programs = {
    firefox.enable = true;
  };
  services = {
    openssh.enable = true;
    ollama = {
      enable = true;
      #acceleration = "rocm"; # "cuda" for Nvidia or "rocm" for AMD, remove for CPU-only
      host = "0.0.0.0";
      port = 11434;
      models = "/var/lib/ollama/models";
    };
  };
  virtualisation.docker.enable = true;
}
