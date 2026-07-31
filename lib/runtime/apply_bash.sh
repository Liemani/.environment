generate_dynamic_prompt() {
  environment_prompt_context

  prompt="$(date "+%H:%M") $ENVIRONMENT_PROMPT_USERNAME@$ENVIRONMENT_PROMPT_HOSTNAME $ENVIRONMENT_PROMPT_PATH"
  if [ -n "$ENVIRONMENT_PROMPT_REPOSITORY_NAME" ]; then
    prompt="$prompt ($ENVIRONMENT_PROMPT_REPOSITORY_NAME/$ENVIRONMENT_PROMPT_BRANCH)"
  fi
  prompt="$prompt $ "

  echo -e "$prompt"
}

PS1='$(generate_dynamic_prompt)'
