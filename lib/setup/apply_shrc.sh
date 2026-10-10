#!/usr/bin/env bash

set -euo pipefail

activation_line=". \"$ENVIRONMENT/activate.sh\""

if [ ! -e "$TARGET_RC" ]; then
  touch "$TARGET_RC"
  printf 'Created shell rc file: %s\n' "$TARGET_RC"
fi

if ! grep -Fqx "$activation_line" "$TARGET_RC"; then
  printf '\n# Added by Liemani environment setup\n' >> "$TARGET_RC"
  printf '%s\n' "$activation_line" >> "$TARGET_RC"
  printf 'Updated shell rc file: %s (added environment activation)\n' "$TARGET_RC"
fi
