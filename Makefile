all: setup

update_dotbot:
	git submodule update --init --remote dotbot
	git submodule update --init --remote dotbot-brew

request_sudo:
	sudo -v

setup: request_sudo
	./install default mac shell brew iterm neovim bins

shell:
	./install shell

iterm:
	./install iterm

brew:
	./install brew

mac:
	./install mac

neovim:
	./install neovim
