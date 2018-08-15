#! /bin/bash

xrdb ~/.Xresources &

xset r rate 400 40 &
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
xmodmap -e 'keycode 134 = Menu' &> /dev/null

if xrandr | grep -q "HDMI-1 connected"; then
	xrandr --output HDMI-1 --left-of eDP-1
	conky -dqc .conky_dual &
elif xrandr | grep -q "^DP-1 connected"; then
	xrandr --output DP-1 --left-of eDP-1
	conky -dqc .conky_dual &
else
	conky -dqc .conky &
fi

[ -f ~/.scripts/bat_check.sh ] && ~/.scripts/bat_check.sh &
[ -f ~/.scripts/bat_eta.py ] && ~/.scripts/bat_eta.py &
[ -f ~/.scripts/gmail.sh ] && ~/.scripts/gmail.sh &

numlockx &
$HOME/.fehbg &
compton -b --config ~/.config/compton.conf

exec bspwm
