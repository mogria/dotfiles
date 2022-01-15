#!/bin/sh
set -e -u

PACKAGES="vim tmux bash"

dotfiles_repo=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)

stow --stow -d "$dotfiles_repo" $PACKAGES || \
    (
      echo "Could not stow packages correctly"
      exit 1
    )

for p in $PACKAGES; do
    postinstall="$dotfiles_repo/$p/postinstall.sh"
    if [ -x "$postinstall" ]; then
        echo "Running postinstall for package $p"
        "$postinstall"
    elif [ -f "$postinstall" ]; then
        echo "warn: postinstall for package $p is disabled (not executable)"
    fi
done

