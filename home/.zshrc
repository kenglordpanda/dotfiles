# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="pygmalion"

zstyle ':omz:update' mode auto      # update automatically without asking

zstyle ':omz:update' frequency 14

ENABLE_CORRECTION="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git git-auto-fetch rust archlinux last-working-dir zsh-256color colored-man-pages zsh-autocomplete zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.histfile
HISTSIZE=1500
SAVEHIST=1500
setopt autocd extendedglob
unsetopt beep nomatch

# Keybind Config
bindkey -v
bindkey -s jk '\e'

# Load non oh-my-zsh plugins
source ~/.oh-my-zsh/custom/plugins/zsh-smartinput/smartinput.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting-filetypes/zsh-syntax-highlighting-filetypes.zsh

zstyle :compinstall filename '/home/kenglordpanda/.zshrc'

autoload -Uz compinit
compinit

export dotfiles_home=~/dotfiles/home/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias vim=nvim

# bun completions
[ -s "/home/kenglordpanda/.bun/_bun" ] && source "/home/kenglordpanda/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export GRIM_DEFAULT_DIR=~/Pictures/Screenshots/
