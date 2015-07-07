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

			battery_percentage=$(upower -i $(upower -e | grep 'BAT') | grep -E 'percentage' | awk '{print $2}')
			echo $battery_percentage
			;;
		s) 
			battery_state=$(upower -i $(upower -e | grep 'BAT') | grep -E 'state' | awk '{print $2}')
			echo $battery_state
			;;
		\?)
			echo $usage
			exit 1
			;;
	esac
done

