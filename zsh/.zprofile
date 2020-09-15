#!/usr/bin/zsh
# ~/.zprofile - Commands to run when starting a login Z shell

if [[ $XDG_VTNR -eq 1 ]] && hash sway 2> /dev/null; then
	if hash qt5ct 2> /dev/null && ! hash plasmashell 2> /dev/null; then
		export QT_QPA_PLATFORMTHEME=qt5ct
	fi
	export QT_QPA_PLATFORM=wayland
	export MOZ_ENABLE_WAYLAND=1
	[[ -d ~/.local/share/sway ]] || mkdir -p ~/.local/share/sway
	exec sway &> ~/.local/share/sway/session.log
elif [[ $XDG_VTNR -eq 1 ]] && [[ ! $DISPLAY ]] && hash startx 2> /dev/null; then
	exec startx -- -keeptty &> ~/.local/share/xorg/session.log
fi
