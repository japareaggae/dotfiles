#!/bin/bash

for package in $(pacman -Qqm); do
	echo "https://aur.archlinux.org/cgit/aur.git/atom/?h=${package}"
done
