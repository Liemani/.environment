#!/usr/bin/env bash

set -euo pipefail

status=0

if bash "$ENVIRONMENT/lib/setup/apply_generated.sh"; then
  if ! bash "$ENVIRONMENT/lib/setup/apply_git.sh"; then
    status=1
  fi
else
  printf 'Skipping Git registration because runtime configuration could not be registered.\n' >&2
  status=1
fi

if ! bash "$ENVIRONMENT/lib/setup/apply_shrc.sh"; then
  status=1
fi

exit "$status"
