all: setup

update_dotbot:
	git submodule update --remote dotbot
	git submodule update --remote dotbot-brew

request_sudo:
	sudo -v

setup: request_sudo
	./install default mac shell brew iterm neovim

shell:
	./install shell

brew:
	./install brew

mac:
	./install mac

neovim:
	./install neovim
