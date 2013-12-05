#!/bin/sh
#
# ~/.xinitrc - Shell script for starting X
# This file is executed by startx

### xinitrc.d - Starts basic daemons such as D-Bus or PulseAudio
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# --- WM/DE
# You can hardcode something here, or use $1 to specify what you want at runtime.
#exec $1
exec i3

