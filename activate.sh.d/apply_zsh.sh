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


lmi_generate_dynamic_prompt() {
    git_root=$(2>/dev/null git rev-parse --show-toplevel)
    git_repo=$(2>/dev/null basename "$git_root")
    git_branch=$(2>/dev/null git rev-parse --abbrev-ref HEAD)

    if [ "$git_root" ]; then
        prompt_path=${PWD##$git_root}
    elif [[ "$PWD" == "$ENVHOME"* ]]; then
        prompt_path='ENV~'${PWD##$ENVHOME}
    else
        prompt_path=$PWD
    fi

    echo -e %F{240}$(date "+%H:%M") %F{208}$git_repo$prompt_path %F{246}\(%F{34}$git_repo%F{246}/%F{34}$git_branch%F{246}\) %F{111}%# %f

    unset prompt_path
}

setopt PROMPT_SUBST

PROMPT='$(lmi_generate_dynamic_prompt)'
