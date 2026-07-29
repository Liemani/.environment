. "$ENVIRONMENT/data/path.sh"

case ":$PATH:" in
  *":$SCRIPT/bin:"*) ;;
  *) export PATH="${PATH:+$PATH:}$SCRIPT/bin" ;;
esac

. "$ENVIRONMENT/data/variable.sh"
. "$ENVIRONMENT/data/alias.sh"
. "$ENVIRONMENT/activate.sh.d/set_viminit.sh"
. "$ENVIRONMENT/activate.sh.d/prompt_context.sh"

case "$RUNTIME_SHELL" in
  bash) . "$ENVIRONMENT/activate.sh.d/apply_bash.sh" ;;
  zsh) . "$ENVIRONMENT/activate.sh.d/apply_zsh.sh" ;;
  *)
    printf 'Unsupported runtime shell: %s\n' "$RUNTIME_SHELL" >&2
    return 1 2>/dev/null || exit 1
    ;;
esac
