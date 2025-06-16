fmt:
	cd nix; nix fmt ./

debian:
	@echo "\e[44mNix Home Manager Switch Flake\e[0m"
	home-manager switch --flake ./nix#debian

nixos:
	@echo "\e[44mNixOS Rebuild Flake\e[0m"
	sudo nixos-rebuild switch --flake ./nix#nixos
