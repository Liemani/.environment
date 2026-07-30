#!/usr/bin/env bash

set -euo pipefail

bash "$ENVIRONMENT/setup.sh.d/common/setup_git.sh"
bash "$ENVIRONMENT/setup.sh.d/common/setup_shrc.sh"
