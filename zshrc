#
# ~/.zshrc - Z Shell configuration
# This is an attempt to configure zsh without using grml-zsh-config.
#

# --- Options
setopt append_history
setopt histignorespace
setopt extended_history
setopt extended_glob
setopt complete_aliases
setopt completeinword
setopt auto_cd
setopt longlistjobs
setopt notify
setopt correct
setopt unset

bindkey -e

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

# --- Completion
# Most of these come from grml.
autoload -U compinit && compinit
zstyle ':completion:*:correct:*'       insert-unambiguous true
zstyle ':completion:*:corrections'     format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*'       original true
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions'    format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
zstyle ':completion:*:history-words'   menu yes
zstyle ':completion:*:history-words'   remove-all-dups yes
zstyle ':completion:*:history-words'   stop yes
zstyle ':completion:*'                 matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:matches'         group 'yes'
zstyle ':completion:*'                 group-name ''
zstyle ':completion:*'                 menu select=5
zstyle ':completion:*:messages'        format '%d'
zstyle ':completion:*:options'         auto-description '%d'
zstyle ':completion:*:options'         description 'yes'
zstyle ':completion:*:processes'       command 'ps -au$USER'
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'
zstyle ':completion:*:warnings'        format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
zstyle ':completion:*:manuals'         separate-sections true
zstyle ':completion:*:manuals.*'       insert-sections   true
zstyle ':completion:*:man:*'           menu yes select
zstyle ":completion:*:commands"        rehash 1

# --- Keyboard
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"   ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"    ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}" ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}" ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"     ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"   ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"   ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"  ]]  && bindkey  "${key[Right]}"   forward-char

# --- Pathes
typeset -U path cdpath fpath manpath
path=($HOME/.bin $path)

# --- Prompt
autoload -U colors && colors
PS1="%{$fg_bold[blue]%}%~%{$reset_color%} $ "
RPS1=""

# --- VTE current directory function (for termite)
if [[ $TERM == xterm-termite ]]; then
	if [[ -e /etc/profile.d/vte.sh ]]; then
		. /etc/profile.d/vte.sh
		__vte_osc7
	fi
fi

# --- Aliases
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
alias gitd="git diff"
alias gitdd="git diff --cached"
alias gitl="git log --decorate=short --stat"
alias gits="git status -sb"
alias gitss="git status"
alias gitgoing="git push origin master"

# mpv
alias mpv-nv="mpv --no-video"
