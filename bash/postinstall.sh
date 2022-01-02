#!/bin/sh

set -eu
install_dir=~/.local/share/ble.sh

( cd "$TMPDIR";
  test ! -d "ble.sh" && git clone --recursive https://github.com/akinomyoga/ble.sh.git
  cd ble.sh
  make install INSDIR="$install_dir"
)

