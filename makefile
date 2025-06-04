fmt:
	cd nix; nix fmt ./

debian:
	@echo "\e[44mNix Home Manager Switch Flake for Debian WSL\e[0m"
	home-manager switch --flake ./nix#debian
