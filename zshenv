#
# ~/.zshenv - zsh environment configuration
#

# --- Path
typeset -U path
path=($HOME/.bin $path)

# --- History
export HISTSIZE=1000

# --- Default Applications
export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less

[ -n $BROWSER ] && BROWSER=xdg-open

# --- Arch Build System
export ABSROOT=/home/japareaggae/Development/abs
