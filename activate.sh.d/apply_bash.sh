#!/bin/bash

source $environment/data/.shenv

# PS1='\e[90m$(date "+%H:%M") \e[91m\w$("$SHELL" $env/data/ash_prompt_git.sh) \e[36m\$\e[0m '


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

#     echo -e \\e[90m$(date "+%H:%M") \\e[91m$repo_local_name$prompt_path \\e[37m\(\\e[92m$repo_local_name\\e[37m/\\e[92m$git_branch\\e[37m\) \\e[36m\$ \\e[0m

  username=`whoami`
  hostname=`hostname -s`

  prompt="$(date "+%H:%M") $username@$hostname $repo_local_name$prompt_path"
  if [ -n "$repo_local_name" ]; then
    prompt="$prompt ($repo_local_name/$git_branch)"
  fi
  prompt="$prompt $ "

  echo -e "$prompt"
}

PS1='$(generate_dynamic_prompt)'
