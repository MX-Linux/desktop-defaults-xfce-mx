#!/bin/bash
if [ ! -e "$HOME/.config/MX-Linux/firstkeyringrun" ]; then
	touch $HOME/.config/MX-Linux/firstkeyringrun
	sleep 5
	gnome-keyring-daemon --replace
fi

exit 0
