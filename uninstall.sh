#!/bin/bash

set -e

SCRIPT_NAME="kwekash"
BIN_PATHS=("$HOME/bin/$SCRIPT_NAME" "$HOME/.local/bin/$SCRIPT_NAME")
MAN_PATH="$HOME/.local/share/man/man1/$SCRIPT_NAME.1.gz"

echo "Uninstalling $SCRIPT_NAME..."

# Remove binary if found
for BIN in "${BIN_PATHS[@]}"; do
  if [ -f "$BIN" ]; then
    echo "Removing $BIN"
    rm -f "$BIN"
  fi
done

# Remove man page
if [ -f "$MAN_PATH" ]; then
  echo "Removing $MAN_PATH"
  rm -f "$MAN_PATH"
fi

echo "✅ Uninstallation complete."
