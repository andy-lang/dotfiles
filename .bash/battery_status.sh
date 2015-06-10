#!/usr/bin/env bash

usage="print information about battery life, where:
	-h: this help
	-p: percentage of battery life remaining
	-s: status of battery"

while getopts "hps" opt; do
	case $opt in
		h)
			echo $usage
			;;
		p)
			battery_percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'percentage' | awk '{print $2}')
			echo $battery_percentage' '
			;;
		s) 
			battery_state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'state' | awk '{print $2}')
			echo $battery_state' '
			;;
		\?)
			echo $usage
			exit 1
			;;
	esac
done

