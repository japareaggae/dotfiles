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
