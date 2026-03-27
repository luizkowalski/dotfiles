.PHONY: install bootstrap brew mac ssh zsh nvim stow-home stow-work

stow-home:
	scripts/stow-force shell nvim cursor ghostty lazygit opencode atuin shell-home

stow-work:
	scripts/stow-force shell nvim cursor ghostty lazygit opencode atuin shell-work

install: bootstrap brew stow-home

bootstrap:
	mkdir -p ~/Projects
	scripts/install_homebrew
	scripts/install_oh_my_zsh

brew:
	brew bundle
	brew analytics off

mac:
	scripts/mac

ssh:
	scripts/install_ssh_keys

zsh:
	scripts/install_zsh_plugins

nvim:
	scripts/install_nvchad
