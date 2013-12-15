#
# ~/.zshenv - zsh environment configuration
#

# --- Path
typeset -U path    # makes sure only unique binaries appear
path=(~/.bin $path)

# --- Default Applications
export EDITOR=vim
export VISUAL=$EDITOR
export BROWSER=google-chrome-unstable
export PAGER=less

# --- Desktop Environment (because exo is gud)
export DE=xfce

# --- Arch Build System
export ABSROOT=/home/japareaggae/Development/abs
