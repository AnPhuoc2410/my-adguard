# ==============================================================================
#                      CUSTOM OPTIMIZED .ZSHRC TEMPLATE
# ==============================================================================

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will load a random theme.
# Popular themes: "robbyrussell" (default), "agnoster", "powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"

# Set list of themes to choose from when ZSH_THEME=random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to turn off colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable marking untracked files
# under VCS as dirty. This makes repository status check for large git
# repositories much slower, but it works very well for small/medium ones.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'strftime' man page for details.
# HIST_STAMPS="mm/dd/yyyy"

# ==============================================================================
#                               PLUGINS
# ==============================================================================
# Standard plugins can be found in $ZSH/plugins/*
# Custom plugins (autosuggestions, syntax-highlighting) should be cloned to:
# $ZSH_CUSTOM/plugins/ (this is handled by install.sh)
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  sudo
  copypath
  copyfile
  colored-man-pages
  extract
)

source $ZSH/oh-my-zsh.sh

# ==============================================================================
#                            USER CONFIGURATION
# ==============================================================================

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nano'
fi

# Language Environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# History Settings
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# ==============================================================================
#                                ALIASES
# ==============================================================================

# General Navigation
alias ll="ls -lahF --color=auto"
alias la="ls -A"
alias l="ls -CF"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias h="history"
alias grep='grep --color=auto'

# Docker & Docker Compose Shortcuts
alias d="docker"
alias dc="docker compose"
alias dco="docker compose"
alias dps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"
alias dpa="docker ps -a"
alias dimages="docker images"
alias dvolume="docker volume"
alias dnetwork="docker network"
alias dclean="docker system prune -a --volumes -f"
alias dlogs="docker logs -f"

# Homelab Repo Shortcuts
alias homelab="cd ~/Homelab"

# System Updates (Debian/Ubuntu)
alias update="sudo apt update && sudo apt upgrade -y"
alias cleanup="sudo apt autoremove -y && sudo apt clean"

# Quick Config Edits
alias zshconfig="nano ~/.zshrc"
alias ohmyzsh="cd ~/.oh-my-zsh"

# ==============================================================================
#                            COMPLETION STYLING
# ==============================================================================
# Force zsh to show autocomplete options list with color styling
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
