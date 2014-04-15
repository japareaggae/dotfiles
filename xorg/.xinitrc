#!/bin/sh
#
# ~/.xinitrc
# Executed by startx (run your window manager from here)

# --- xsession
[ -e $HOME/.xprofile ] && source $HOME/.xprofile

# --- WM/DE
# You can use exec $1 to specify a WM at runtime, or hardcode something
#exec $1
exec i3

