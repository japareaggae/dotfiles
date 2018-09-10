# ~/.zshenv

### Path
typeset -U path
path=($HOME/.bin $path[@])

### Preferred Applications
export EDITOR=vim

### Arch Linux directories
export ABSROOT="$HOME/Development/abs"
export AURDEST="$HOME/Development/pkgbuilds"

### pass
export PASSWORD_STORE_CLIP_TIME=15
export PASSWORD_STORE_ENABLE_EXTENSIONS="true"