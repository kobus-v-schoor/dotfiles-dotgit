#! /bin/bash

polybar-msg hook notify-$1 $2
sleep 3
polybar-msg hook notify-$1 1
