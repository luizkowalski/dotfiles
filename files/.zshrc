# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export GOPATH=$HOME/go
# export PATH="$PATH:${GOPATH}/bin"

export GOPATH="/Users/${USER}/go"
export ZSH="/Users/${USER}/.oh-my-zsh"
export BUN_INSTALL="$HOME/.bun"
export CDPATH="$CDPATH:$HOME/Projects"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PATH:/Users/${USER}/bin"
export PATH="$PATH:/Users/${USER}/.local/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/17/bin"
export PATH="$PATH:/opt/homebrew/opt/node@20/bin"
export PATH="$PATH:/Users/${USER}/.spicetify"
export PATH=/Users/luiz.kowalski/.opencode/bin:$PATH

export KUBECONFIG=~/.kube/cf-auth-okta.yaml:~/.kube/cf-staging.yaml:~/.kube/cf-preview.yaml:~/.kube/cf-internal.yaml:~/.kube/cf-production.yaml:~/.kube/cf-convenience.yaml

export AWS_PROFILE="shared_production"

# export NVM_DIR="$HOME/.nvm"

# export EDITOR="cursor --wait"
# export VISUAL="cursor --wait"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="wezm"

DEFAULT_USER="${USER}"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

VSCODE='cursor'

ANSIBLE_HOME="$HOME/.ansible"
ANSIBLE_CONFIG="$HOME/.ansible.cfg"

source ~/.secrets

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  ansible
  bundler
  brew
  # docker
  # docker-compose
  fzf-tab
  git
  macos
  mise
  poetry
  rails
  # ruby
  terraform
  tmux
  vscode
  zsh-autosuggestions
  zsh-syntax-highlighting
  # zsh-autocomplete
  # dotenv
  encode64
  genpass
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

source ~/.aliases
source ~/.functions

eval "$(atuin init zsh --disable-up-arrow)"
eval "$(starship init zsh)"

if [[ -f $(which uv) ]]; then
  eval "$(uv generate-shell-completion zsh)"
fi

# eval "$(mcfly init zsh)"
# eval "$(mcfly-fzf init zsh)"
# eval "$(rbenv init - zsh)"
# eval "$(/opt/homebrew/bin/mise activate zsh)"
# eval "$(mise activate zsh --shims)" # should be first
# eval "$(mise activate zsh)"

# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
# [ -s "/Users/luiz/.bun/_bun" ] && source "/Users/luiz/.bun/_bun"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/luiz.kowalski/.lmstudio/bin"
# End of LM Studio CLI section
