#!/bin/sh


log=$(xinput list | grep "Logitech Unifying Device")
syn=$(xinput list | grep "Synaptics TouchPad")

if [ "$1" -eq "0" ]; then
	id=$(echo "$syn" | tr " " " " | awk '{print $6}' | tr "=" " " | awk '{print $2}')
	xinput set-prop "$id" "Device Enabled" 0
	echo "touchpad off"
elif [ "$1" -eq "1" ]; then
	id=$(echo "$syn" | tr " " " " | awk '{print $6}' | tr "=" " " | awk '{print $2}')
	xinput set-prop "$id" "Device Enabled" 1
	echo "touchpad on"
fi


