INSTALL_FLAGS ?=

all: setup

update_dotbot:
	git submodule update --init --remote dotbot
	git submodule update --init --remote dotbot-brew

request_sudo:
	sudo -v

setup: request_sudo
	./install $(INSTALL_FLAGS) default mac shell brew neovim bins ssh cursor

fresh: request_sudo
	./install --fresh default mac shell brew neovim bins ssh cursor

shell:
	./install $(INSTALL_FLAGS) shell

brew:
	./install $(INSTALL_FLAGS) brew

mac:
	./install $(INSTALL_FLAGS) mac

neovim:
	./install $(INSTALL_FLAGS) neovim

bins:
	./install $(INSTALL_FLAGS) bins

ssh:
	./install $(INSTALL_FLAGS) ssh

cursor:
	./install $(INSTALL_FLAGS) cursor
