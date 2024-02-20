# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="Predawn"

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
source ~/.zsh/plugins/zsh-smartinput/smartinput.plugin.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting-filetypes/zsh-syntax-highlighting-filetypes.zsh

# OhMyPosh Config
# eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/iterm2.omp.json)"
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/material.omp.json)"

zstyle :compinstall filename '/home/kenglordpanda/.zshrc'

autoload -Uz compinit
compinit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
