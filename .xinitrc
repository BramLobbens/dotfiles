xrdb -merge ~/.Xresources

pgrep redshift &> /dev/null || redshift &> /dev/null &
xsetroot -cursor_name left_ptr &
sxhkd &
compton --config ~/.config/compton.conf &
urxvt &
ibus-daemon -drx &
exec bspwm

