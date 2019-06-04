#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# start x

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
    xsetroot -cursor_name left_ptr
fi
