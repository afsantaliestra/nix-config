setup:
	git update-index --assume-unchanged ./config.nix

unsetup:
	git update-index --no-assume-unchanged ./config.nix

fmt:
	nix fmt ./

debian:
	@echo "\e[44m## Nix Home Manager Switch with Flake ###\e[0m"
	home-manager switch --flake ./#debian

nixos:
	@echo "\e[44m### NixOS Rebuild with Flake ###\e[0m"
	sudo nixos-rebuild switch --flake .#nixos
