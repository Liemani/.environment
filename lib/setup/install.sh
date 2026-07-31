#!/usr/bin/env bash

set -euo pipefail

bash "$ENVIRONMENT/lib/setup/apply_git.sh"
bash "$ENVIRONMENT/lib/setup/apply_shrc.sh"
