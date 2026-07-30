#!/usr/bin/env bash

set -euo pipefail

git config --global include.path "$ENVIRONMENT/effective/.gitconfig"
mkdir -p "$HOME/.config/git"
ln -sfn "$ENVIRONMENT/effective/.gitignore" "$HOME/.config/git/ignore"
