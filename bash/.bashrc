#
# ~/.bashrc - Bourne-Again Shell configuration
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# --- Environment
[[ $HOME/.bash_env ]] && source $HOME/.bash_env

# --- Options
shopt -s cdspell dirspell extglob checkwinsize

# --- ls colors
eval $(dircolors)

# --- Less colors
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# --- Prompt
PS1="$(tput bold)$(tput setaf 4)\w$(tput sgr0) \$ "

# --- Aliases
alias ..='cd ..'

# grep
alias grep='grep --color=auto'

# ls
alias ls="ls --color=auto"
alias l="ls -l --color=auto"
alias la="ls -la --color=auto"

# Git
alias gita="git add"
alias gitap="git add -p"
alias gitb="git branch"
alias gitcom="git commit"
alias gitgoing="git push origin master"

# mpv
alias mpv-nv="mpv --no-video"
