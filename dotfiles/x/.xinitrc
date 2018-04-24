xset r rate 400 40
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
xmodmap -e 'keycode 134 = Menu'

[ -f ~/.scripts/bat_check ] && ~/.scripts/bat_check.sh &
[ -f ~/.scripts/gmail.sh ] && $HOME/.scripts/gmail.sh &

numlockx &
compton --backend glx &
$HOME/.fehbg &

exec bspwm
