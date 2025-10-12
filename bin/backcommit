#!/bin/bash

#	인자를 repository로 받기
#	if [[ $# -ne 0 ]]; then
#		repositories=($@)
#		repositories=(${repositories/#/$git\/})
#	else
#		repositories=($(find $git -depth 1 -type d))
#	fi

if [[ $# -ge 2 ]]; then
	echo 'usage: aux backcommit [<message>]'
	exit 1
fi

if [[ $# -eq 0 ]]; then
	1="backup"
fi

repositories=($(find $git -depth 1 -type d))
for repository in $repositories; do
	cd $repository
	aux commit "$1"
done
