# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation (optional)
export ZSH="$HOME/.oh-my-zsh"

# Use Powerlevel10k as your prompt theme
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# Load Powerlevel10k config if it exists
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Add Zsh features
autoload -U compinit && compinit
autoload -U promptinit && promptinit
setopt prompt_subst

# Syntax Highlighting
# Requires: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions
# Requires: git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# History configs
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# Environment
export EDITOR="nvim"
export VISUAL="nvim"

# Aliases
alias ll='eza -la --color=auto'
alias la='eza -TA'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias update='sudo pacman -Syu'
alias nv='nvim'
alias clr='clear'
alias please='sudo'
alias install='sudo pacman -S'
alias hyprconfig='code ~/.config/hypr/hyprland.conf'
alias kittyconfig='code ~/.config/kitty/kitty.conf'
alias zshconfig='code ~/.zshrc'
alias uninstall='sudo pacman -R'



# Git-aware prompt (optional if you're not using p10k for git info)
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst

# Speed boost (only load completion once)
zstyle ':completion:*' rehash true

# Completion tweaks
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Path setup
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"

# Starship fallback (optional)
# eval "$(starship init zsh)"

# Source any custom local files
[[ -f ~/.zsh_local ]] && source ~/.zsh_local

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec Hyprland
fi

[ -f "$HOME/.cache/wal/colors.sh" ] && source "$HOME/.cache/wal/colors.sh"

pokemon-colorscripts --random
