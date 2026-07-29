#!/usr/bin/env bash

# Establish installer paths and OS-based target shell context.
. "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)/setup.sh.d/context.sh"

bash "$ENVIRONMENT/setup.sh.d/setup.sh"
