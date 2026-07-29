# This file must be sourced from Bash or Zsh.
if [ -n "${ZSH_VERSION-}" ]; then
  _activate_source="${(%):-%x}"
  export RUNTIME_SHELL="zsh"
elif [ -n "${BASH_VERSION-}" ]; then
  _activate_source="${BASH_SOURCE[0]}"
  export RUNTIME_SHELL="bash"
else
  printf 'activate.sh supports Bash and Zsh only.\n' >&2
  return 1 2>/dev/null || exit 1
fi

export ENVIRONMENT="$(CDPATH= builtin cd "$(dirname "$_activate_source")" && pwd -P)" || return 1
export ENVHOME="$(CDPATH= builtin cd "$ENVIRONMENT/.." && pwd -P)" || return 1
unset _activate_source

. "$ENVIRONMENT/activate.sh.d/activate.sh"
