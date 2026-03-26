.PHONY: bootstrap brew mac ssh zsh nvim stow-home

stow-home:
	stow shell nvim cursor ghostty lazygit opencode atuin shell-home

stow-work:
	stow shell nvim cursor ghostty lazygit opencode atuin shell-work

bootstrap:
	mkdir -p ~/Projects
	scripts/install_oh_my_zsh
	scripts/install_homebrew

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
