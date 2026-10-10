#!/usr/bin/env bash

set -euo pipefail

SSH_DIRECTORY="$HOME/.ssh"
SSH_CONFIG="$SSH_DIRECTORY/config"
INCLUDE_LINE='Include ~/.config/environment/private/.ssh/config'

if [ ! -d "$SSH_DIRECTORY" ]; then
  mkdir -p "$SSH_DIRECTORY"
  printf 'Created directory: %s\n' "$SSH_DIRECTORY"
fi

if [ -L "$SSH_CONFIG" ] || { [ -e "$SSH_CONFIG" ] && [ ! -f "$SSH_CONFIG" ]; }; then
  printf 'Refusing to replace non-regular SSH configuration: %s\n' "$SSH_CONFIG" >&2
  exit 1
fi

if [ ! -e "$SSH_CONFIG" ]; then
  umask 077
  printf '%s\n' "$INCLUDE_LINE" > "$SSH_CONFIG"
  printf 'Created SSH config: %s\n' "$SSH_CONFIG"
elif ! grep -Fqx "$INCLUDE_LINE" "$SSH_CONFIG"; then
  temporary="$(mktemp "$SSH_DIRECTORY/.config.XXXXXX")"
  trap 'rm -f "$temporary"' EXIT
  cp -p "$SSH_CONFIG" "$temporary"
  {
    printf '%s\n' "$INCLUDE_LINE"
    cat "$SSH_CONFIG"
  } > "$temporary"
  mv "$temporary" "$SSH_CONFIG"
  trap - EXIT
  printf 'Updated SSH config: %s (added environment Include)\n' "$SSH_CONFIG"
fi
