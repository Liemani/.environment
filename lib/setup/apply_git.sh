#!/usr/bin/env bash

set -euo pipefail

git config --global include.path "$HOME/.config/environment/generated/.gitconfig"
printf 'Updated global Git config: include.path = %s\n' "$HOME/.config/environment/generated/.gitconfig"
