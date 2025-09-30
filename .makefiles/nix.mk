.PHONY: fmt news clean debian debian laia anne

fmt:
	@$(call pinfo,Formatting Nix code with Alejandra Style)
	nix fmt ./

news:
	@$(call pinfo,Nix Home Manager News)
	home-manager switch news --flake ./#debian

clean:
	@$(call pinfo,Nix Collect Garbage older than 30d)
	nix-collect-garbage -d --delete-older-than 30d

debian: fmt
	@$(call pinfo,Nix Home Manager Switch (Debian))
	home-manager switch --flake ./#debian $(RUN_ARGS)

laia: fmt
	@$(call pinfo,NixOS Rebuild Switch - Host: laia)
	sudo nixos-rebuild switch --flake ./#laia $(RUN_ARGS)

anne: fmt
	@$(call pinfo,NixOS Rebuild Switch - Host: Anne)
	sudo nixos-rebuild switch --flake ./#anne $(RUN_ARGS)
