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

# --- dircolors
eval $(dircolors)

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
creset=$(tput sgr0)
if [[ $EUID == 0 ]]; then
	color=$(tput bold; tput setaf 1)
	PS1="\[${color}\][\u@\h] \w\[${creset}\] \$ "
elif [[ "$SSH_TTY" ]]; then
	color=$(tput bold; tput setaf 2)
	PS1="\[${color}\][\h] \w\[${creset}\] \$ "
else
	color=$(tput bold; tput setaf 4)
	PS1="\[${color}\][\h] \w\[${creset}\] \$ "
fi
unset color creset

# --- Aliases
alias ..='cd ..'
alias cget="curl -OL -C -"
alias cview='DISPLAY= cacaview'
alias grep='grep --color=auto'
alias ls="ls --color=auto"
alias l="ls --color=auto"
alias la="ls -la --color=auto"
alias ll="ls -l --color=auto"
alias lsnew="ls -ltr --color=auto"
alias lsold="ls -lt --color=auto"
alias mimecp="cp ~/.config/mimeapps.list ~/.local/share/applications/mimeapps.list"
alias mimediff="vimdiff ~/.config/mimeapps.list ~/.local/share/applications/mimeapps.list"
alias mpv-nv="mpv --no-video"
alias sdctl="systemctl"
alias sdctlu="systemctl --user"
alias xrefres="xrdb ~/.Xresources"

# --- Functions
function search(){
	find "$(pwd)" -iname "*$1*"
}

function updpkgbuild(){
	git checkout HEAD .
	git pull
}
