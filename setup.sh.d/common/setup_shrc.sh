#!/usr/bin/env bash

set -euo pipefail

activation_line=". \"$ENVIRONMENT/activate.sh\""

touch "$TARGET_RC"

if ! grep -Fqx "$activation_line" "$TARGET_RC"; then
  printf '%s\n' "$activation_line" >> "$TARGET_RC"
fi
