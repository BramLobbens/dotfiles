pgrep redshift &> /dev/null || redshift &> /dev/null &
sxhkd &
urxvt &
compton --config ~/.config/compton.conf &
exec bspwm
