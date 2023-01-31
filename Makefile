###############################################################################
# ENVIRONMENT CONFIGURATION
###############################################################################
MAKEFLAGS += --no-print-directory
SHELL=/bin/bash

.PHONY: help

###############################################################################
# GOAL PARAMETERS
###############################################################################

UNIT_TEST ?= "false"

###############################################################################
# GOALS ( safe defaults )
###############################################################################

help:
	@echo "Available goals:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

###############################################################################
# GOALS
###############################################################################

local: ## Run this action locally using act
	@act --rm --actor=nearform-actions/k8s-kurated-addons-action --container-options "-v $(HOME)/.kube:/root/.kube --net=host" --input docker-registry=dev.local --input unit-test=$(UNIT_TEST)
