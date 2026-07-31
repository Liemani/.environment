. "$ENVIRONMENT/effective/path.sh"

case ":$PATH:" in
  *":$SCRIPT/bin:"*) ;;
  *) export PATH="${PATH:+$PATH:}$SCRIPT/bin" ;;
esac

. "$ENVIRONMENT/effective/variable.sh"
. "$ENVIRONMENT/effective/alias.sh"
. "$ENVIRONMENT/effective/runtime/set_viminit.sh"
. "$ENVIRONMENT/effective/runtime/prompt_context.sh"

case "$RUNTIME_SHELL" in
  bash) . "$ENVIRONMENT/effective/runtime/apply_bash.sh" ;;
  zsh) . "$ENVIRONMENT/effective/runtime/apply_zsh.sh" ;;
  *)
    printf 'Unsupported runtime shell: %s\n' "$RUNTIME_SHELL" >&2
    return 1 2>/dev/null || exit 1
    ;;
esac
