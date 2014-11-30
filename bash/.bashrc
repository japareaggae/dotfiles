#
# ~/.bashrc - Bourne-Again Shell configuration
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# --- Environment
[[ $HOME/.bash_env ]] && source $HOME/.bash_env

# --- GPG_TTY
export GPG_TTY=$(tty)

# --- Options
shopt -s cdspell dirspell extglob checkwinsize
export HISTCONTROL='ignoreboth'
export HISTSIZE=8096

# --- ls colors
eval $(dircolors ~/.dircolors)

# --- Less colors
export LESS="-R"
export LESS_TERMCAP_mb=$(tput setaf 1)
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_se=$(tput sgr0)
export LESS_TERMCAP_so=$(tput smso)
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_us=$(tput setaf 2)

# --- Prompt
color=$(tput bold; tput setaf 4)
creset=$(tput sgr0)
PS1="\[${color}\][\h] \w\[${creset}\] \$ "
unset color c_reset

# --- Aliases
alias ..='cd ..'
alias cget="curl -OL -C -"
alias cview='DISPLAY= cacaview'
alias grep='grep --color=auto'
alias ls="ls --color=auto"
alias l="ls -l --color=auto"
alias la="ls -la --color=auto"
alias lsnew="ls -ltr --color=auto"
alias lsold="ls -lt --color=auto"
alias mpv-nv="mpv --no-video"
alias sdctl="systemctl"
alias sdctlu="systemctl --user"
alias xrefres="xrdb ~/.Xresources"

# --- Functions
function search(){
	find "$(pwd)" -iname "*$1*"
}

