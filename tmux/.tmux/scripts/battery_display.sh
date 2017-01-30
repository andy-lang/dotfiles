#!/usr/bin/env bash

status=$(~/.dotfiles/bash/battery_status.sh -s)

if [ "$status" == "fully-charged" ]; then
	echo "fully charged"
else
	echo $(~/.dotfiles/bash/battery_status.sh -p)
fi
