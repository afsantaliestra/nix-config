setup:
	git update-index --assume-unchanged ./config.nix

unsetup:
	git update-index --no-assume-unchanged ./config.nix

fmt:
	nix fmt ./

news:
	@echo "\e[44m## Nix Home Manager News ###\e[0m"
	home-manager switch news --flake ./#debian

debian:
	@echo "\e[44m## Nix Home Manager Switch ###\e[0m"
	home-manager switch --flake ./#debian

nixos:
	@echo "\e[44m### NixOS Rebuild ###\e[0m"
	sudo nixos-rebuild switch --flake .#nixos
