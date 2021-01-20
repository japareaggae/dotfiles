# ~/.zshrc
### General
setopt autocd
setopt correct
setopt completeinword
setopt autocontinue
setopt longlistjobs
setopt autopushd pushdminus pushdsilent pushdtohome
setopt interactivecomments

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
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'

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
zstyle ':completion:*:processes'       command 'ps -au$USER'

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
alias mv="mv -iv"
alias cp="cp -riv" # will break on bsd
alias mkdir="mkdir -vp"

if ! ( hash tree 2> /dev/null ); then
	alias tree="exa -T"
fi

alias cget="curl -OLC-"
alias gdd="gnome-disks --restore-disk-image"
alias mpv-nv="mpv --no-video"
alias pkgchanges="pacolog -l 10"
alias udmount="udisksctl mount -b"
alias udumount="udisksctl unmount -b"
alias resolve="resolvectl query"

if [[ -r /etc/debian_version ]] ; then
	alias fd="fdfind"
fi

### Functions
source ~/.zshfunc
