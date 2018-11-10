#!/usr/bin/zsh
if [[ $XDG_VTNR -eq 1 ]] && [[ -z $DISPLAY ]] && (hash startx 2> /dev/null); then
	exec startx
fi
