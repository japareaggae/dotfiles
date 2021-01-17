#!/usr/bin/zsh
# ~/.zprofile - Commands to run when starting a login Z shell

if [[ $XDG_VTNR -eq 1 ]] && [[ ! $WAYLAND_DISPLAY ]] && [[ ! $DISPLAY ]] && hash sway 2> /dev/null; then
	exec startsway
elif [[ $XDG_VTNR -eq 1 ]] && [[ ! $DISPLAY ]] && hash startx 2> /dev/null; then
	exec startx -- -keeptty &> ~/.local/share/xorg/session.log
fi
