#!/bin/sh

set -eux
install_dir="$HOME/.local/share/ble.sh"


if [ -f "$install_dir/ble.sh" ]; then
  echo "Skipping build of ble.sh, seems already installed in $install_dir"
  exit 0
fi

( cd "$TMPDIR";
  test -d "ble.sh" && exit 0
  git clone --recursive https://github.com/akinomyoga/ble.sh.git
  cd ble.sh
  git checkout v0.3.3
  make install INSDIR="$install_dir"
)

