#!/usr/bin/env bash

set -euo pipefail

CONFIG_DIRECTORY="$HOME/.config"
TARGET="$CONFIG_DIRECTORY/environment"
SOURCE="$ENVIRONMENT/generated"

mkdir -p "$CONFIG_DIRECTORY"

if [ -L "$TARGET" ]; then
  rm "$TARGET"
elif [ -e "$TARGET" ]; then
  printf 'Refusing to replace non-symlink runtime configuration: %s\n' "$TARGET" >&2
  exit 1
fi

ln -s "$SOURCE" "$TARGET"
