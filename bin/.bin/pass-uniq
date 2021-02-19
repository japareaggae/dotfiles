#!/bin/bash

STORE="$HOME/.password-store"
passwords=()

for file in $(fd . $STORE -e gpg); do
	file=${file##$STORE/}
	file=${file%.*}
	password="$(pass $file | head -n1)"
	passwords+=($password)
done

echo "==> Found the following repeated passwords:"
printf '%s\n' "${passwords[@]}" | sort | uniq -d
echo "Run 'pass grep <password>' to see which entries use them"
