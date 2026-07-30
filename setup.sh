#!/usr/bin/env bash

set -euo pipefail

# Establish installer paths and OS-based target shell context.
. "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)/setup.sh.d/context.sh"

if [ ! -d "$ENVIRONMENT/effective" ]; then
  printf 'No effective configuration found. Create profile/profile.ini and run ./build.sh before setup.\n' >&2
  exit 1
fi

bash "$ENVIRONMENT/setup.sh.d/setup.sh"
