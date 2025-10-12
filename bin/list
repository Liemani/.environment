#!/bin/zsh

list=$(find $aux -iname "*.sh")
if [[ $# -eq 0 ]]; then
	echo $list | xargs basename | sed "s/\.sh$//" | sort
elif [[ $# -eq 1 && $1 == "-l" ]]; then
	echo $list | sed "s/^\./\$aux/"
else
	echo 'usage: aux list [-l]'
	exit 1
fi
