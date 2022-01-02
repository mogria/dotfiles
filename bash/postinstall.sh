#!/bin/sh

set -eu
install_dir="$HOME/.local/share/blesh"


if [ -f "$install_dir/ble.sh" ]; then
  echo "Skipping build of ble.sh, seems already installed in $install_dir"
  exit 0
fi

( cd "$TMPDIR";
  test -f "ble.sh/ble.sh" || \
    git clone --recursive https://github.com/akinomyoga/ble.sh.git
  cd ble.sh
  git checkout v0.4.0-devel2
  make install INSDIR="$install_dir"
)

