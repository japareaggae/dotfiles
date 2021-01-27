# ~/.zshenv

### Path
typeset -U path
path=($HOME/.bin $path[@])

### Preferred Applications
export EDITOR=nvim
export VISUAL=nvim

### Arch Linux directories
export ABSROOT="$HOME/Development/abs"
export AURDEST="$HOME/Development/pkgbuilds"

### pass
export PASSWORD_STORE_CLIP_TIME=15
export PASSWORD_STORE_ENABLE_EXTENSIONS="true"

### less
export LESS="FRMi"
export SYSTEMD_LESS="${LESS}S"

### GPG agent as SSH agent
(( $+commands[gpgconf] )) && export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

### Wine
export WINEDLLOVERRIDES=winemenubuilder.exe=d

### XDG Base Directory support
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
