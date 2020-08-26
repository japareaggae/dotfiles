# ~/.zshrc
### General
setopt autocd
setopt correct
setopt completeinword
setopt autocontinue

### History
HISTFILE=~/.zsh_history
HISTSIZE=8192
SAVEHIST=8192
setopt appendhistory
setopt sharehistory
setopt extended_history
setopt hist_ignore_space

### Environment variables for interactive use
# less colors
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput setaf 2)
export LESS_TERMCAP_ue=$(tput sgr0)

# Inform VTE of current directory (for termite/tilix)
if [[ $TERM == xterm-termite ]] || [[ $VTE_VERSION ]]; then
	. /etc/profile.d/vte.sh
fi

# Tab completion colors
if [[ $(uname) == "Darwin" ]]; then
	eval $(gdircolors -b)
else
	eval $(printf "TERM alacritty\n$(dircolors -p)" | dircolors -)
fi

### GPG agent
if ( hash gpg-connect-agent 2> /dev/null ); then
	export GPG_TTY=$(tty)
	gpg-connect-agent updatestartuptty /bye > /dev/null
fi

### Window titles
case $TERM in
	alacritty|termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
		precmd ()  { print -Pn "\e]0;[%M] %~ %#\a" }
		preexec () { print -Pn "\e]0;[%M] %~ %# $1\a" }
		;;
esac

### Keybinds
bindkey -e
# This makes sure terminfo entries are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
	function zle-line-init() {
		echoti smkx
	}
	function zle-line-finish() {
		echoti rmkx
	}
	zle -N zle-line-init
	zle -N zle-line-finish
fi
bindkey -- "${terminfo[kich1]}" overwrite-mode
bindkey -- "${terminfo[kdch1]}" delete-char
bindkey -- "${terminfo[khome]}" beginning-of-line
bindkey -- "${terminfo[kend]}"  end-of-line

# <https://www.arp242.net/zshrc.html#filter-history-completion-with-what-you-typed>
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -- "${terminfo[kcuu1]}"   up-line-or-beginning-search
bindkey -- "${terminfo[kcud1]}"   down-line-or-beginning-search

# from grml
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey -- "${terminfo[kpp]}"   history-beginning-search-backward-end
bindkey -- "${terminfo[knp]}"   history-beginning-search-forward-end

# Numpad Enter <https://github.com/robbyrussell/oh-my-zsh/issues/6159#issuecomment-382140433>
bindkey -s "^[OM" "^M"

### Completions
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' rehash true
zstyle ':completion:*:descriptions' format $'%F{green}completing %B%d%b%f'
zstyle ':completion:*:matches'      group 'yes'
zstyle ':completion:*'              group-name ''
zstyle ':completion:*:messages'     format '%d'
zstyle ':completion:*:options'      auto-description '%d'
zstyle ':completion:*:manuals'      separate-sections true
zstyle ':completion:*:manuals.*'    insert-sections   true

### Prompt
if [[ $EUID -eq 0 ]]; then
	color="red"
elif [[ $SSH_TTY ]]; then
	color="green"
else
	color="blue"
fi
PS1="%B%F{$color}[%m] %~ %b%f%# "
unset color

### Aliases
if ( hash exa 2> /dev/null); then
	alias ls="exa"
	alias l="exa"
	alias la="exa -a"
	alias ll="exa -l"
	alias lla="exa -l -a"
	alias lsbig="exa -l -s size"
	alias lssmall="exa -l -r -s size"
	alias lsnew="exa -l -s modified"
	alias lsold="exa -l -r -s modified"
else
	alias ls="ls --color=auto"
	alias l="ls --color=auto"
	alias la="ls -a"
	alias ll="ls -l"
	alias lla="ls -l -a"
	alias lsbig="ls -l -r -S"
	alias lssmall="ls -l -S"
	alias lsnew="ls -l -r -t"
	alias lsold="ls -l -t"
fi
alias cget="curl -OLC-"
alias gdd="gnome-disks --restore-disk-image"
alias mpv-nv="mpv --no-video"
alias udmount="udisksctl mount -b"
alias udumount="udisksctl unmount -b"
alias resolve="resolvectl query"

if [[ -r /etc/debian_version ]] ; then
	alias fd="fdfind"
fi

### Functions
source ~/.zshfunc
