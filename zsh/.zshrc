# ~/.zshrc
### General
setopt autocd

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
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye > /dev/null

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
alias fd="fdfind"
alias l="exa"
alias ll="exa -l"
alias ls="ls --color=auto"
alias mpv-nv="mpv --no-video"

### Functions
pacexplicit() { pacman -Qqe | grep -v "$(pacman -Qqeg base base-devel)" ; }

# simple notes
# <https://bbs.archlinux.org/viewtopic.php?pid=1812351#p1812351>
n() {
	local files
	files=(${@/#/$HOME/Notes/})
	${EDITOR:-vi} $files
}

# TAB completion for notes
_notes() {
	_files -g "*" -W $HOME/Notes
}
compdef _notes n

# list notes
nls() {
	tree -CR --dirsfirst --noreport $HOME/Notes | awk '{
	if (NF==1) print $1;
	else if (NF==2) print $2;
	else if (NF==3) printf "  %s\n", $3
	}'
}

green() {
	# Lane Cover (0) = 1000 - Desired Green Number (310) * Hi-Speed Value (x) * BPM ($1) / 174
	python -c "print(-174000/(-310*$1))"
}
