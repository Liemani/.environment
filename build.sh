#!/usr/bin/env bash

set -euo pipefail

ENVIRONMENT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
exec bash "$ENVIRONMENT/lib/build/renderer.sh" "$ENVIRONMENT"
