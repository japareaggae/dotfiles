#!/bin/bash

# This script creates an initial hierarchy and deploys the most basic dotfiles
# with Stow. In the future, this script may be used to install all of our
# favorite packages in one go.

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/share"
mkdir -p "$HOME/.cache"

stow -vS zsh git bin
