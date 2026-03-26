# Kowa's Dotfiles

## Prerequisites

* Homebrew
* Chrome
* Ghostty
* Bitwarden CLI (`bw`) unlocked before running the `ssh` target
* GNU stow (`brew install stow`)

## Install

Link dotfiles and run setup scripts as needed:

```shell
make stow        # link all dotfiles via stow
make bootstrap   # oh-my-zsh + homebrew + ~/Projects
make brew        # brew bundle
make mac         # macOS defaults
make ssh         # SSH keys (requires Bitwarden CLI unlocked)
make zsh         # zsh plugins
make nvim        # NvChad
```

## Local Overrides

```shell
cp shell/.zshrc.local.example ~/.zshrc.local
cp shell/.gitconfig.local.example ~/.gitconfig.local
```

Use local overrides for machine-specific paths, Git identity, and private environment settings.

## Stow Packages

* `shell` — shell config, git, and tool configs under `~/.config/`
* `nvim` — NvChad Neovim config under `~/.config/nvim/`
* `cursor` — Cursor MCP config under `~/.cursor/`
* `ghostty` — Ghostty terminal config under `~/.config/ghostty/`
* `lazygit` — Lazygit config under `~/.config/lazygit/`
* `opencode` — OpenCode config under `~/.config/opencode/`
* `atuin` — Atuin shell history config under `~/.config/atuin/`
