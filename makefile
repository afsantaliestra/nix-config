MAKEFILE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
include $(wildcard $(MAKEFILE_DIR).makefiles/*.mk)

TARGETS_WITH_ARGS := laia anne debian
ifneq ($(filter $(firstword $(MAKECMDGOALS)),$(TARGETS_WITH_ARGS)),)
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # Marcar todos los argumentos como phony dinámicamente
  .PHONY: $(RUN_ARGS)
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY: setup unsetup

setup:
	git update-index --assume-unchanged ./config.nix

unsetup:
	git update-index --no-assume-unchanged ./config.nix
