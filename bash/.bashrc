#
# ~/.bashrc - Bourne-Again Shell configuration
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# --- Environment
[[ $HOME/.bash_env ]] && source $HOME/.bash_env

# --- Options
shopt -s cdspell dirspell extglob checkwinsize
export HISTCONTROL='ignoreboth'

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
c_bold=$(tput bold)
c_blue=$(tput setaf 4)
c_reset=$(tput sgr0)
PS1="\[${c_bold}${c_blue}\]\w\[${c_reset}\] \$ "
unset c_bold c_blue c_reset

# --- Aliases
alias ..='cd ..'
alias cget="curl -OL -C -"
alias grep='grep --color=auto'
alias ls="ls --color=auto"
alias l="ls -l --color=auto"
alias la="ls -la --color=auto"
alias lsnew="ls -ltr --color=auto"
alias lsold="ls -lt --color=auto"
alias mpv-nv="mpv --no-video"
alias search="find $PWD -iname"

# --- Functions
keychain-run(){
	eval $(keychain --eval -Q id_rsa)
}
