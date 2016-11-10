#
# ~/.bash_profile
#

# -- bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# -- keychain
[[ -x /usr/bin/keychain ]] && eval $(keychain --eval --agents gpg,ssh --quiet --noask)

# -- xorg
if [[ -z $DISPLAY ]] && [[ -n $XDG_VTNR ]] && [[ $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
