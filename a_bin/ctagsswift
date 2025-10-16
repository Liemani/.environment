#!/bin/zsh



if [[ $# -ne 0 ]]; then
	echo 'usage: aux ctagsswift'
	exit 0
fi



# ctags -a -f $tags_dir/tags $(find -L $1 -iname "*.[hc]")
ctags . $(find -L . -iname "*.swift")
