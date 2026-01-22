#!/bin/bash
# set git config

. $environment/data/git.sh

git config --global user.name $git_user_name
git config --global user.email $git_user_email
git config --global core.excludesFile $environment/data/.gitignore
git config --global alias.pull "git pull --rebase"
git config --global init.defaultBranch main
git config --global diff.tool vimdiff
git config --global difftool.vimdiff.cmd 'vimdiff "$LOCAL" "$REMOTE"'
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.vimdiff.cmd 'vimdiff "$BASE" "$LOCAL" "$REMOTE" "$MERGED"'
git config --global mergetool.vimdiff.trustExitCode false
