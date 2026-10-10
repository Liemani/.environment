#!/usr/bin/env bash

set -euo pipefail

CONFIG_DIRECTORY="$HOME/.config"
TARGET="$CONFIG_DIRECTORY/environment"
SOURCE="$ENVIRONMENT/generated"

if [ ! -d "$CONFIG_DIRECTORY" ]; then
  mkdir -p "$CONFIG_DIRECTORY"
  printf 'Created directory: %s\n' "$CONFIG_DIRECTORY"
fi

if [ -L "$TARGET" ]; then
  rm "$TARGET"
  action='Replaced symlink'
elif [ -e "$TARGET" ]; then
  printf 'Refusing to replace non-symlink runtime configuration: %s\n' "$TARGET" >&2
  exit 1
else
  action='Created symlink'
fi

ln -s "$SOURCE" "$TARGET"
printf '%s: %s -> %s\n' "$action" "$TARGET" "$SOURCE"
