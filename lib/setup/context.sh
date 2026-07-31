#!/usr/bin/env bash

# This file is sourced by the Bash installer entrypoint.
INSTALLER_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)" || return 1

export ENVIRONMENT="$INSTALLER_ROOT"
export ENVHOME="$(cd "$ENVIRONMENT/.." && pwd -P)" || return 1
export INSTALLER_OS="$(uname -s)"

case "$INSTALLER_OS" in
  Darwin)
    export TARGET_SHELL="zsh"
    export TARGET_RC="$HOME/.zshrc"
    ;;
  Linux)
    export TARGET_SHELL="bash"
    export TARGET_RC="$HOME/.bashrc"
    ;;
  *)
    printf 'Unsupported operating system: %s\n' "$INSTALLER_OS" >&2
    return 1
    ;;
esac
