# if xcape is installed, remap Ctrl keys + CapsLock to be Escape
if [ -n $(which xcape 2>/dev/null) ]; then
	xcape -e 'Control_L=Escape;Control_R=Escape;Caps_Lock=Escape'
fi
