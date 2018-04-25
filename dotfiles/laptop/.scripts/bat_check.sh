#! /bin/bash

low=15
crt=5

p=
l=
while true; do
	sleep 10s
	p=$l
	l=$(cat /sys/class/power_supply/BAT0/capacity)
	[[ -z $p ]] && p=$l
	[[ $l -gt $low ]] && continue
	[[ $p -gt $low ]] && ~/.scripts/notify.sh alert 2 & continue
	[[ $l -gt $crt ]] && continue
	[[ $p -gt $crt ]] && systemctl suspend && continue
done

