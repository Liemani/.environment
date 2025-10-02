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

  repo_local_path=$(2>/dev/null git rev-parse --show-toplevel)
  repo_local_name=$(2>/dev/null basename "$repo_local_path")
  git_branch=$(2>/dev/null git rev-parse --abbrev-ref HEAD)

  if [ -n "$repo_local_path" ]; then
    prompt_path="${PWD##$repo_local_path}"
    if [ -z "$prompt_path" ]; then
      prompt_path="/"
    fi
  elif [[ "$PWD" == "$ENVHOME"* ]]; then
    prompt_path='$ENVHOME'"${PWD##$ENVHOME}"
  elif [[ "$PWD" == "$HOME"* ]]; then
    prompt_path='~'"${PWD##$HOME}"
  else
    prompt_path="$PWD"
  fi

  username=`whoami`
  hostname=`hostname -s`

  prompt="%F{8}$(date "+%H:%M") %F{6}$username%F{8}@%F{4}$hostname %F{3}$prompt_path"
  if [ -n "$repo_local_name" ]; then
#    prompt="$prompt %F{7}(%F{2}$repo_local_name%F{7}/%F{2}$git_branch%F{7})"
    prompt="$prompt %F{8}(%F{2}$repo_local_name%F{8}/%F{2}$git_branch%F{8})"
  fi
  prompt="$prompt %F{7}%#%f "

  echo -e "$prompt"
}

setopt PROMPT_SUBST

PROMPT='$(generate_dynamic_prompt)'
