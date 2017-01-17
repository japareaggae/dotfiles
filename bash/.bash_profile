#
# ~/.bash_profile
#

# -- bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# -- xorg
if [[ -z $DISPLAY ]] && [[ -n $XDG_VTNR ]] && [[ $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
