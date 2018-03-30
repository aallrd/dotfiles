.PHONY: all
all: bin dotfiles sysconfig tools ## Creates the symlinks for bin and the dotfiles, configures the system and install the necessary tools.

.PHONY: bin
bin: ## Installs the bin directory files.
		@# add aliases for things in bin
		@for file in $(shell find $(CURDIR)/bin -type f); do \
			f=$$(basename $$file); \
			sudo ln -sf $$file /usr/local/bin/$$f; \
		done

.PHONY: dotfiles
dotfiles: ## Creates symlinks for the the dotfiles.
		@fooswan --symlinks-dotfiles
		@#git update-index --skip-worktree $(CURDIR)/.gitconfig;
		@#ln -snf $(CURDIR)/.fonts $(HOME)/.local/share/fonts;

.PHONY: sysconfig
sysconfig: ## Configures the system.
		@fooswan --configure-system

.PHONY: tools
tools: ## Installs the required basic tools.
		@fooswan --install-basic-tools

.PHONY: help
help:
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
