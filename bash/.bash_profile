#
# ~/.bash_profile
#

# -- bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# -- keychain
[[ -x /usr/bin/keychain ]] && eval $(keychain --eval --agents gpg,ssh --quiet --noask)

# -- xorg
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
