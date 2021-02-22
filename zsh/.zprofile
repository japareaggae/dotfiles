#!/usr/bin/zsh
# ~/.zprofile - Commands to run when starting a login Z shell

if [[ $XDG_VTNR -eq 1 ]] && [[ ! $WAYLAND_DISPLAY ]] && [[ ! $DISPLAY ]] && (( $+commands[sway] )); then
	exec startsway
elif [[ $XDG_VTNR -eq 1 ]] && [[ ! $DISPLAY ]] && (( $+commands[startx] )); then
	[[ -d "$HOME/.local/share/xorg" ]] || mkdir -p "$HOME/.local/share/xorg"
	exec startx -- -keeptty &> "$HOME/.local/share/xorg/session.log"
fi
