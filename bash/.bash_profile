#
# ~/.bash_profile
#

# -- environment
[[ $HOME/.bash_env ]] && source $HOME/.bash_env

# -- bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# -- xorg
if [[ -z $DISPLAY ]] && [[ -n $XDG_VTNR ]] && [[ $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
