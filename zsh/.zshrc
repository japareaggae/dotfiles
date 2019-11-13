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

### Environment variables (for interactive use)
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput setaf 2)
export LESS_TERMCAP_ue=$(tput sgr0)
eval $(dircolors -b)

### GPG agent
if ( hash gpg-connect-agent 2> /dev/null ); then
	export GPG_TTY=$(tty)
	gpg-connect-agent updatestartuptty /bye > /dev/null
fi

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
bindkey -- "${terminfo[kpp]}"   up-line-or-history
bindkey -- "${terminfo[knp]}"   down-line-or-history
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
alias l="exa"
alias la="exa -a"
alias ll="exa -l"
alias lsbig="exa -l -s size"
alias lssmall="exa -l -r -s size"
alias ls="ls --color=auto"
alias mpv-nv="mpv --no-video"
alias udmount="udisksctl mount -b"
alias udumount="udisksctl unmount -b"

if [[ -r /etc/debian_version ]] ; then
	alias fd="fdfind"
fi

### Functions
source ~/.zshfunc
