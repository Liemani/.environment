environment_prompt_context() {
  ENVIRONMENT_PROMPT_REPOSITORY=$(2>/dev/null git rev-parse --show-toplevel)
  ENVIRONMENT_PROMPT_REPOSITORY_NAME=$(2>/dev/null basename "$ENVIRONMENT_PROMPT_REPOSITORY")
  ENVIRONMENT_PROMPT_BRANCH=$(2>/dev/null git rev-parse --abbrev-ref HEAD)

  if [ -n "$ENVIRONMENT_PROMPT_REPOSITORY" ]; then
    ENVIRONMENT_PROMPT_PATH="${PWD##$ENVIRONMENT_PROMPT_REPOSITORY}"
    if [ -z "$ENVIRONMENT_PROMPT_PATH" ]; then
      ENVIRONMENT_PROMPT_PATH="/"
    fi
  elif [[ "$PWD" == "$ENVHOME"* ]]; then
    ENVIRONMENT_PROMPT_PATH='$ENVHOME'"${PWD##$ENVHOME}"
  elif [[ "$PWD" == "$HOME"* ]]; then
    ENVIRONMENT_PROMPT_PATH='~'"${PWD##$HOME}"
  else
    ENVIRONMENT_PROMPT_PATH="$PWD"
  fi

  ENVIRONMENT_PROMPT_USERNAME=$(whoami)
  ENVIRONMENT_PROMPT_HOSTNAME=$(hostname -s)
}
