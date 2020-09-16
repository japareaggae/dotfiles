#!/usr/bin/zsh
# ~/.zprofile - Commands to run when starting a login Z shell

if [[ $XDG_VTNR -eq 1 ]] && hash sway 2> /dev/null; then
	# qt5ct -- This is on xprofile too but Wayland doesn't use that
	if hash qt5ct 2> /dev/null && ! hash plasmashell 2> /dev/null; then
		export QT_QPA_PLATFORMTHEME=qt5ct
	fi

	# Export XDG environment for applications
	# <https://man.sr.ht/~kennylevinsen/greetd/#how-to-set-xdg_session_typewayland>
	export XDG_SESSION_TYPE=wayland
	export XDG_SESSION_DESKTOP=sway
	export XDG_CURRENT_DESKTOP=sway

	# Use Wayland in certain toolkits
	export QT_QPA_PLATFORM=wayland
	export CLUTTER_BACKEND=wayland
	export MOZ_ENABLE_WAYLAND=1

	# Use a directory for keeping sway logs (like on Xorg)
	[[ -d ~/.local/share/sway ]] || mkdir -p ~/.local/share/sway
	exec sway &> ~/.local/share/sway/session.log
elif [[ $XDG_VTNR -eq 1 ]] && [[ ! $DISPLAY ]] && hash startx 2> /dev/null; then
	exec startx -- -keeptty &> ~/.local/share/xorg/session.log
fi
