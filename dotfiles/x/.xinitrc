#! /bin/bash

xrdb ~/.Xresources

xset r rate 400 40
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
xmodmap -e 'keycode 134 = Menu'

[ -f ~/.scripts/bat_check ] && ~/.scripts/bat_check.sh &
# [ -f ~/.scripts/gmail.sh ] && $HOME/.scripts/gmail.sh &

numlockx &
$HOME/.fehbg &
conky -dqc .conky
compton -b --config ~/.config/compton.conf

exec bspwm
