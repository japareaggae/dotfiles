#
# ~/.bash_profile
#

export EDITOR=vim
[[ -n $BROWSER ]] && export BROWSER=xdg-open

PATH=$HOME/.bin:$PATH

[[ -f ~/.bashrc ]] && . ~/.bashrc
