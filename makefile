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
