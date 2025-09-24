MAKEFILE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
include $(wildcard $(MAKEFILE_DIR)makefiles/*.mk)

.PHONY: setup unsetup

setup:
	git update-index --assume-unchanged ./nix/config.nix

unsetup:
	git update-index --no-assume-unchanged ./nix/config.nix
