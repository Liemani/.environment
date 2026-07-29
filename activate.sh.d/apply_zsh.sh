# Zsh-only completion and interactive behavior.
if [ -t 0 ]; then
  stty -ixon
fi

if [ -z "${ENVIRONMENT_ZSH_COMPLETION_INITIALIZED-}" ]; then
  autoload -Uz compinit
  compinit
  ENVIRONMENT_ZSH_COMPLETION_INITIALIZED=1
fi

generate_dynamic_prompt() {
  environment_prompt_context

  prompt="%F{8}$(date "+%H:%M") %F{6}$ENVIRONMENT_PROMPT_USERNAME%F{8}@%F{4}$ENVIRONMENT_PROMPT_HOSTNAME %F{3}$ENVIRONMENT_PROMPT_PATH"
  if [ -n "$ENVIRONMENT_PROMPT_REPOSITORY_NAME" ]; then
    prompt="$prompt %F{8}(%F{2}$ENVIRONMENT_PROMPT_REPOSITORY_NAME%F{8}/%F{2}$ENVIRONMENT_PROMPT_BRANCH%F{8})"
  fi
  prompt="$prompt %F{7}%#%f "

  echo -e "$prompt"
}

setopt PROMPT_SUBST

PROMPT='$(generate_dynamic_prompt)'

bindkey -e
