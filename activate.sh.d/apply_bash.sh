#!/bin/bash

# PS1='\e[90m$(date "+%H:%M") \e[91m\w$("$SHELL" $env/data/ash_prompt_git.sh) \e[36m\$\e[0m '


generate_dynamic_prompt() {
  git_root=$(2>/dev/null git rev-parse --show-toplevel)
  git_repo=$(2>/dev/null basename "$git_root")
  git_branch=$(2>/dev/null git rev-parse --abbrev-ref HEAD)

  if [ "$git_root" ]; then
    prompt_path=${PWD##$git_root}
  elif [[ "$PWD" == "$ENVHOME"* ]]; then
    prompt_path='$ENVHOME'${PWD##$ENVHOME}
  elif [[ "$PWD" == "$HOME"* ]]; then
    prompt_path='~'${PWD##$HOME}
  else
    prompt_path=$PWD
  fi

#     echo -e \\e[90m$(date "+%H:%M") \\e[91m$git_repo$prompt_path \\e[37m\(\\e[92m$git_repo\\e[37m/\\e[92m$git_branch\\e[37m\) \\e[36m\$ \\e[0m

  username=`whoami`
  hostname=`hostname -s`

  prompt="$(date "+%H:%M") $username $hostname $git_repo$prompt_path"
  if [ -n "$git_repo" ]; then
    prompt="$prompt ($git_repo/$git_branch)"
  fi
  prompt="$prompt $ "

  echo -e "$prompt"

  unset prompt_path
  unset username
  unset hostname
}

PS1='$(generate_dynamic_prompt)'
