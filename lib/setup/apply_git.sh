#!/usr/bin/env bash

set -euo pipefail

git config --global include.path "$HOME/.config/environment/.gitconfig"
printf 'Updated global Git config: include.path = %s\n' "$HOME/.config/environment/.gitconfig"
