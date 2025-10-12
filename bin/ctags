#!/bin/zsh



if [[ $# -eq 1 ]]; then
	tags_dir=.
elif [[ $# -eq 2 ]]; then
	tags_dir=$2
else
	echo 'usage: aux ctags <directory to configure> <directory for tags>'
	exit 0
fi



# ctags -a -f $tags_dir/tags $(find -L $1 -iname "*.[hc]")
ctags -f $tags_dir/tags $(find -L $1 -iname "*.[hc]")
