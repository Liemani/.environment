#!/bin/bash

# PS1='\e[90m$(date "+%H:%M") \e[91m\w$("$SHELL" $env/data/ash_prompt_git.sh) \e[36m\$\e[0m '


lmi_generate_dynamic_prompt() {
  git_root=$(2>/dev/null git rev-parse --show-toplevel)
  git_repo=$(2>/dev/null basename "$git_root")
  git_branch=$(2>/dev/null git rev-parse --abbrev-ref HEAD)

  if [ "$git_root" ]; then
    prompt_path=${PWD##$git_root}
  elif [[ "$PWD" == "$HOME"* ]]; then
    prompt_path='~'${PWD##$HOME}
  elif [[ "$PWD" == "$ENVHOME"* ]]; then
    prompt_path='$ENVHOME'${PWD##$ENVHOME}
  else
    prompt_path=$PWD
  fi

#     echo -e \\e[90m$(date "+%H:%M") \\e[91m$git_repo$prompt_path \\e[37m\(\\e[92m$git_repo\\e[37m/\\e[92m$git_branch\\e[37m\) \\e[36m\$ \\e[0m

  hostname=`hostname -s`

  echo -e $(date "+%H:%M") $hostname $git_repo$prompt_path \($git_repo/$git_branch\) \$" "

  unset prompt_path
}

PS1='$(lmi_generate_dynamic_prompt)'
