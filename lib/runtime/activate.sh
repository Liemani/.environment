. "$ENVIRONMENT/generated/path.sh"

case ":$PATH:" in
  *":$SCRIPT/bin:"*) ;;
  *) export PATH="${PATH:+$PATH:}$SCRIPT/bin" ;;
esac

. "$ENVIRONMENT/generated/variable.sh"
. "$ENVIRONMENT/generated/alias.sh"
. "$ENVIRONMENT/generated/runtime/set_viminit.sh"
. "$ENVIRONMENT/generated/runtime/prompt_context.sh"

case "$RUNTIME_SHELL" in
  bash) . "$ENVIRONMENT/generated/runtime/apply_bash.sh" ;;
  zsh) . "$ENVIRONMENT/generated/runtime/apply_zsh.sh" ;;
  *)
    printf 'Unsupported runtime shell: %s\n' "$RUNTIME_SHELL" >&2
    return 1 2>/dev/null || exit 1
    ;;
esac
