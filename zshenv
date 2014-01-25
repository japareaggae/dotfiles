#
# ~/.zshenv - zsh environment configuration
#

# --- Path
typeset -U path
path=($(ruby -rubygems -e "puts Gem.user_dir")/bin $HOME/.bin $path)

# --- History
export HISTSIZE=1000

# --- Default Applications
export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less

[ -n $BROWSER ] && BROWSER=google-chrome-unstable

# --- Arch Build System
export ABSROOT=/home/japareaggae/Development/abs
