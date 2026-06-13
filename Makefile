# creates simlinks to my ~.local/bin/
PREFIX ?= $(HOME)/.local/bin
SCRIPTS := zed-install deno-install ollama-install nix-install bun-install nvm-install pnpm-install
REPO_DIR := $(shell pwd)

.PHONY: install uninstall

install:
	@echo "Installing scripts to $(PREFIX)"
	@mkdir -p $(PREFIX)
	@for script in $(SCRIPTS); do \
		chmod +x $(REPO_DIR)/$$script; \
		ln -sf $(REPO_DIR)/$$script $(PREFIX)/$$script; \
		echo "Linked $$script"; \
	done
	@echo "Install complete"

uninstall:
	@echo "Removing scripts from $(PREFIX)"
	@for script in $(SCRIPTS); do \
		rm -f $(PREFIX)/$$script; \
		echo "Removed $$script"; \
	done
	@echo "Uninstall complete"
