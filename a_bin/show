#!/bin/bash

if [[ $# -ne 2 ]]; then
	echo 'usage: aux show <rev> <path to file>'
    exit 1
fi

path_to_file=$(git ls-tree -r --name-only --full-name $1 | grep /$2)

if [[ $path_to_file = "" ]]; then
    echo "$(basename $0): No [$2] exist!!"
    exit 1
fi

git show $1:$path_to_file
