all: setup

update_dotbot:
	git submodule update --init --remote dotbot
	git submodule update --init --remote dotbot-brew

request_sudo:
	sudo -v

setup: request_sudo
	./install default mac shell brew neovim bins ssh cursor

shell:
	./install shell

brew:
	./install brew

mac:
	./install mac

neovim:
	./install neovim

bins:
	./install bins

ssh:
	./install ssh

cursor:
	./install cursor
