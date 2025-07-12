#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

source ~/powerlevel10k/powerlevel10k.sh

# Created by `pipx` on 2025-07-12 20:13:47
export PATH="$PATH:/home/taps/.local/bin"
