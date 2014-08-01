#
# ~/.bash_profile
#

# -- bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# -- xorg
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
