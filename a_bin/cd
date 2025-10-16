#!/bin/zsh
# cd to the script file directory

if [[ $# -ne 1 ]]; then
	echo 'usage: aux cd <aux command>'
	return 0
fi


. $aux_find $1

cd $(dirname $aux_return)

unset aux_return
