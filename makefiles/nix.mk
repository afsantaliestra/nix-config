fmt:
	@$(call pinfo,Formatting Nix code with Alejandra Style)
	cd nix; nix fmt ./

news:
	@$(call pinfo,Nix Home Manager News)
	home-manager switch news --flake ./nix#debian

clean:
	@$(call pinfo,Nix Collect Garbage older than 30d)
	nix-collect-garbage -d --delete-older-than 30d

debian: fmt
	@$(call pinfo,Nix Home Manager Switch (Debian))
	home-manager switch --flake ./nix#debian

laia: fmt
	@$(call pinfo,NixOS Rebuild Switch - Host: laia)
	sudo nixos-rebuild switch --flake ./nix#laia

kristine: fmt
	@$(call pinfo,NixOS Rebuild Switch - Host: laia)
	sudo nixos-rebuild switch --flake ./nix#kristine

# CONTAINERS
cont-restart: cont-stop cont-start

cont-start:
	@$(call pinfo,Starting NixOS Containers: dev-env)
	sudo nixos-container start dev-env

cont-stop:
	@$(call pinfo,Stopping NixOS Containers: dev-env)
	sudo nixos-container stop dev-env

.PHONY: fmt news clean debian laia cont-start cont-stop cont-restart