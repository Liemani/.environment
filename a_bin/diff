#!/bin/zsh

if [[ $# -eq 0 ]]; then
	echo 'usage: aux diff <files>'
    exit 1
fi

for name in $@; do
	files=($(find $git -iname $name))
	for file in $files; do
		cd $(dirname $file)
		git diff ./$name
	done
done
