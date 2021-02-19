#!/bin/bash
# https://lists.zx2c4.com/pipermail/password-store/2017-February/002703.html
pushd ${PASSWORD_STORE_DIR:-$HOME/.password-store} > /dev/null
find * -type f -name '*.gpg' | while read passfile; do
	printf "[${passfile%.gpg}]: "
	gpg --quiet -d "$passfile"
	printf "\n"
done
popd > /dev/null
