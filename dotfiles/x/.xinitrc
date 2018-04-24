xset r rate 400 40
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
xmodmap -e 'keycode 134 = Menu'

~/.scripts/bat_check.sh &
$HOME/.scripts/gmail.sh &

numlockx &
compton --backend glx &
polybar -q status &
$HOME/.fehbg &

exec bspwm
