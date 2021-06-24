#!/bin/zsh

if [[ $# -eq 0 ]]; then
	git status
	exit 0
fi

for local_repo in $@; do
	echo -n "\n\n\n"
	echo path: \$git${local_repo#"$git"}
	cd $local_repo
	git status
done
