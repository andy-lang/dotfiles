#!/usr/bin/env bash

status=$(~/.bash/battery_status.sh -s)

if [ "$status" == "fully-charged" ]; then
	echo "fully charged"
else
	echo $(~/.bash/battery_status.sh -p)
fi
