all: setup

update_dotbot:
	git submodule update --remote dotbot

request_sudo:
	sudo -v

setup: request_sudo
	./install default mac shell brew iterm

shell:
	./install shell

brew:
	./install brew

mac:
	./install mac
