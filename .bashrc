#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="ls --color=auto"
alias pacs="sudo pacman -S"
alias pacup="sudo pacman -Syu"
alias pacf="pacman -Ss"
alias pacq="pacman -Q"
alias rm="rm -i"

PS1="[\u@\h \W]\$ "
