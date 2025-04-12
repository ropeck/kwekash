#!/bin/bash

set -e

SCRIPT_NAME="kwekash"

if [ -d "$HOME/bin" ]; then
  TARGET="$HOME/bin"#!/bin/bash

set -e

SCRIPT_NAME="kwekash"
MANPAGE="man/$SCRIPT_NAME.1"

# Choose install directory
if [ -d "$HOME/bin" ]; then
  TARGET="$HOME/bin"
else
  TARGET="$HOME/.local/bin"
fi

INSTALL_PATH="$TARGET/$SCRIPT_NAME"
MAN_TARGET="$HOME/.local/share/man/man1"

echo "Installing $SCRIPT_NAME to $INSTALL_PATH..."
mkdir -p "$TARGET"
cp bin/$SCRIPT_NAME "$INSTALL_PATH"
chmod +x "$INSTALL_PATH"

echo "Installing man page to $MAN_TARGET..."
mkdir -p "$MAN_TARGET"
cp "$MANPAGE" "$MAN_TARGET/"
gzip -f "$MAN_TARGET/$SCRIPT_NAME.1"  # compress to .1.gz format

# Suggest path setup
if ! command -v "$SCRIPT_NAME" &>/dev/null; then
  echo ""
  echo "⚠️  '$SCRIPT_NAME' is not in your PATH."
  echo "You can add it by appending this to your shell profile:"
  echo ""
  echo "    export PATH=\"$TARGET:\$PATH\""
  echo ""
fi

echo "✅ Installed successfully. You can now run '$SCRIPT_NAME' and 'man $SCRIPT_NAME'."

else
  TARGET="$HOME/.local/bin"
fi

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
  echo "    export PATH=\"$TARGET:\$PATH\""
  echo ""
  echo "Then restart your terminal or run: source ~/.zshrc (or ~/.bash_profile)"
else
  echo "✅ Installed successfully. You can now run '$SCRIPT_NAME'."
fi
