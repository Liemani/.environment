#!/usr/bin/env bash

set -euo pipefail

ENVIRONMENT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# Establish installer paths and OS-based target shell context.
. "$ENVIRONMENT/lib/setup/context.sh"

if [ ! -d "$ENVIRONMENT/effective" ]; then
  printf 'No effective configuration found. Create profile/profile.ini and run ./build.sh before setup.\n' >&2
  exit 1
fi

bash "$ENVIRONMENT/lib/setup/install.sh"
