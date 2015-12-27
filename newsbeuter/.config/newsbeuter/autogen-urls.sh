#!/bin/bash
DEVDIR="$HOME/Development/pkgbuilds/*"

for NODE in $DEVDIR; do
	if [ -d $NODE ]; then
		echo "https://aur.archlinux.org/cgit/aur.git/atom/?h=${NODE#$DEVDIR}"

		#grep "^source.*git" $NODE/PKGBUILD
	fi
done
