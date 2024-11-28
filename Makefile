.PHONY: all
all: init gitconfig link brew

.PHONY: init
init:
	@echo "Initialize..."
	.bin/init.sh

.PHONY: link
link:
	@echo "Link dotfiles..."
	.bin/link.sh

.PHONY: brew
brew:
	@echo "Install brew packages..."
	.bin/brew.sh 

.PHONY: gitconfig
gitconfig:
	@echo "Setup gitconfig..."
	.bin/setup-gitconfig.sh

.PHONY: zsh
zsh:
	@echo "Setup zsh..."
	.bin/.