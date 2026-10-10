#!/usr/bin/env bash

set -euo pipefail

CONFIG_DIRECTORY="$HOME/.config"
TARGET="$CONFIG_DIRECTORY/environment"

ensure_link() {
  local link="$TARGET/$1" source="$2"

  if [ -L "$link" ]; then
    if [ "$(readlink "$link")" = "$source" ]; then
      return
    fi
    rm "$link"
  elif [ -e "$link" ]; then
    printf 'Refusing to replace non-symlink: %s\n' "$link" >&2
    return 1
  fi

  ln -s "$source" "$link"
  printf 'Linked: %s -> %s\n' "$link" "$source"
}

if [ ! -d "$CONFIG_DIRECTORY" ]; then
  mkdir -p "$CONFIG_DIRECTORY"
  printf 'Created directory: %s\n' "$CONFIG_DIRECTORY"
fi

if [ -L "$TARGET" ]; then
  printf 'Refusing to replace environment symlink; expected a directory: %s\n' "$TARGET" >&2
  exit 1
fi

if [ -e "$TARGET" ] && [ ! -d "$TARGET" ]; then
  printf 'Refusing to replace non-directory environment configuration: %s\n' "$TARGET" >&2
  exit 1
fi

if [ -d "$TARGET" ]; then
  for name in generated private; do
    if [ -e "$TARGET/$name" ] && [ ! -L "$TARGET/$name" ]; then
      printf 'Refusing to replace non-symlink: %s\n' "$TARGET/$name" >&2
      exit 1
    fi
  done
fi

if [ ! -d "$TARGET" ]; then
  mkdir "$TARGET"
  printf 'Created directory: %s\n' "$TARGET"
fi

ensure_link generated "$ENVIRONMENT/generated"
ensure_link private "$ENVHOME/.private"
