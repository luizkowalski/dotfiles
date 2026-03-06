# Kowa's Dotfiles

## Prerequisites

* Chrome
* Ghostty
* Bitwarden CLI (`bw`) unlocked before running the `ssh` target
* Xcode Command Line Tools on macOS

## Install

```shell
make
```

## Local Overrides

```shell
cp files/.zshrc.local.example ~/.zshrc.local
cp files/.gitconfig.local.example ~/.gitconfig.local
```

Use local overrides for machine-specific paths, Git identity, and private environment settings.

## Fresh Install

```shell
make fresh
```

`make` now avoids wiping existing Neovim and Oh My Zsh state. Use `make fresh` when you explicitly want the destructive reset behavior.

## Targets

* `make` installs the default macOS profile
* `make shell` links shell config and installs shell plugins
* `make brew` applies `files/Brewfile`
* `make neovim` installs the NvChad starter if Neovim is not already configured
* `make ssh` installs SSH material from Bitwarden
* `make cursor` links Cursor MCP config

## MCP Config

```shell
python3 scripts/sync_mcp_configs.py
```

`files/mcp/servers.json` is the shared source for MCP server definitions used by OpenCode and Cursor.
