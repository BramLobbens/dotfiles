#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#load background
./.fehbg
# Run ufetch on start
ufetch | lolcat
fortune -s
# aliases
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias pacs="sudo pacman -S"
alias pacup="sudo pacman -Syu"
alias pacf="pacman -Ss"
alias pacq="pacman -Q"
alias rm="rm -i"
alias em="emacs -nw"
alias acpi="acpi | cowsay | lolcat"
alias date="date | cowsay | lolcat"
# prompt
PS1="[\u@\h \W]\$ "

# exports
## java
export _JAVA_AWT_WM_NONREPARENTING=1
## sass
export PATH="~/packages/dart-sass/:$PATH"
## ibus (language ime)
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

## flask and psql
#export FLASK_APP=application.py
#export FLASK_ENV=development
#export DATABASE_URL_P1="postgres://uommqlizuisari:b1601533d7d9c23ae54d9e876533cf082025ac6c99b5cf0000889cccc4f88fcc@ec2-54-217-205-90.eu-west-1.compute.amazonaws.com:5432/d71c7eldcopir5"
#export APP_API_KEY="UGlj3W2H0jlcWcLlOoRlaQ"
#export DATABASE_URL_LECTURE4="postgres:///lecture4"

