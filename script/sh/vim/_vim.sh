#!/bin/bash
# wrap vim

export repo_local_path=$(2>/dev/null git rev-parse --show-toplevel)
export repo_local_name=$(2>/dev/null basename "$repo_local_path")
export git_branch=$(2>/dev/null git rev-parse --abbrev-ref HEAD)

>/dev/null builtin cd -

command vim "$@"



unset repo_local_path
unset repo_local_name
unset git_branch
