#!/usr/bin/zsh
if systemctl -q is-active graphical.target && [[ $XDG_VTNR -eq 1 ]] && [[ ! $DISPLAY ]] && (hash startx 2> /dev/null); then
	exec startx
fi
