#!/bin/sh
#
# ~/.xinitrc
# Executed by startx (run your window manager from here)

# --- xsession
[ -e $HOME/.xprofile ] && source $HOME/.xprofile

# ---  Xresources
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# --- xrandr-adjust
(command -v xrandr-adjust > /dev/null) && xrandr-adjust

# --- xset
[ -f ~/.bin/dim-screen ] && xset s 300 300 && xset dpms 605 605 605

# --- WM/DE
# You can use exec $1 to specify a WM at runtime, or hardcode something
#exec $1
exec i3

