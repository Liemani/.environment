#!/bin/zsh

## prompt start
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# 
# # Format the vcs_info_msg_0_ variable
# zstyle ':vcs_info:git:*' formats '%F{246}(%F{34}%r%F{246}/%F{34}%b%F{246}) '
# zstyle ':vcs_info:*' enable git
# PROMPT='%F{240}%T %F{208}%~ $vcs_info_msg_0_%F{111}%#%f '
## prompt end

# Set up the prompt (with git branch name)
# PROMPT='%F{240}%T %F{208}%~ $vcs_info_msg_0_%F{111}%#%f '
# PROMPT='%F{240}%T %F{208}%~ $vcs_info_msg_0_%F{240}$LINES,$COLUMNS %F{111}%#%f '


generate_dynamic_prompt() {
  PWD=$(realpath $PWD)

  git_root=$(2>/dev/null git rev-parse --show-toplevel)
  git_repo=$(2>/dev/null basename "$git_root")
  git_branch=$(2>/dev/null git rev-parse --abbrev-ref HEAD)

  if [ -n "$git_root" ]; then
    prompt_path="${PWD##$git_root}"
  elif [[ "$PWD" == "$ENVHOME"* ]]; then
    prompt_path='$ENVHOME'"${PWD##$ENVHOME}"
  elif [[ "$PWD" == "$HOME"* ]]; then
    prompt_path='~'"${PWD##$HOME}"
  else
    prompt_path="$PWD"
  fi

  username=`whoami`
  hostname=`hostname -s`

  prompt="%F{240}$(date "+%H:%M") %F{111}$username %F{12}$hostname %F{208}$git_repo$prompt_path"
  if [ -n "$git_repo" ]; then
    prompt="$prompt %F{246}(%F{34}$git_repo%F{246}/%F{34}$git_branch%F{246})"
  fi
  prompt="$prompt %F{111}%#%f "

  echo -e "$prompt"
}

setopt PROMPT_SUBST

PROMPT='$(generate_dynamic_prompt)'
