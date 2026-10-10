#!/usr/bin/env bash

set -euo pipefail

ENVIRONMENT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# Establish installer paths and OS-based target shell context.
. "$ENVIRONMENT/lib/setup/context.sh"

if [ ! -d "$ENVIRONMENT/generated" ]; then
  printf 'No generated configuration found. Create profile/profile.toml and run ./build.sh before setup.\n' >&2
  exit 1
fi

if [ ! -f "$ENVHOME/.private/.ssh/config" ]; then
  printf 'Private SSH configuration not found: %s\n' "$ENVHOME/.private/.ssh/config" >&2
  exit 1
fi

bash "$ENVIRONMENT/lib/setup/install.sh"
