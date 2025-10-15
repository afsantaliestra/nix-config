MAKEFILE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
include $(wildcard $(MAKEFILE_DIR).makefiles/*.mk)

HOSTNAME := $(shell hostname)
.DEFAULT_GOAL := $(HOSTNAME)

.PHONY: fmt
fmt:
	@$(call pinfo,Formatting Nix code with Alejandra Style)
	alejandra ./

.PHONY: wsl
wsl: fmt
	@$(call pinfo,NixOS Rebuild Switch - Host: wsl)
	sudo nixos-rebuild switch --flake ./#wsl

.PHONY: laia
laia: fmt
	@$(call pinfo,NixOS Rebuild Switch - Host: laia)
	sudo nixos-rebuild switch --flake ./#laia

.PHONY: debian
debian: fmt
	@$(call pinfo,Home Manager Switch - Profile: debian)
	home-manager switch --flake ./#debian

.PHONY: clean
clean:
	@$(call pinfo,Nix Collect Garbage older than 14d)
	nix-collect-garbage -d --delete-older-than 14d
