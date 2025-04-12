#!/bin/bash

set -e

TARGET="$HOME/.local/bin"
SCRIPT_NAME="kwekash"
INSTALL_PATH="$TARGET/$SCRIPT_NAME"

echo "Installing $SCRIPT_NAME to $INSTALL_PATH..."

mkdir -p "$TARGET"
cp bin/$SCRIPT_NAME "$INSTALL_PATH"
chmod +x "$INSTALL_PATH"

if ! command -v "$SCRIPT_NAME" &>/dev/null; then
  echo ""
  echo "⚠️  '$SCRIPT_NAME' is not in your PATH."
  echo "You can add it by appending this to your shell profile:"
  echo ""
  echo "    export PATH=\"$HOME/.local/bin:\$PATH\""
  echo ""
  echo "Then restart your terminal or run: source ~/.zshrc (or ~/.bash_profile)"
else
  echo "✅ Installed successfully. You can now run '$SCRIPT_NAME'."
fi
