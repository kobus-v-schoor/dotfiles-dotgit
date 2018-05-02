#! /bin/bash

uds=$(wc -l ~/.updates)

tmp=$(checkupdates)
[[ $tmp ]] && echo "$tmp" > ~/.updates
[[ $tmp ]] || echo -n > ~/.updates

if [[ $uds < $(wc -l ~/.updates) ]]; then
	echo "New updates" > /tmp/conky_notify
fi

