#!/bin/zsh

if [[ $# -ne 1 ]]; then
	echo 'usage: . $find <what>'
	echo
	echo 'This script is composed for in script purpose'
	return 1
fi



aux_target_basename=$1.sh

aux_return=$(find $aux -iname $aux_target_basename)

aux_command_array=(${(f)aux_return})
aux_array_count=$#aux_command_array

if [[ $aux_array_count -gt 1 ]]; then
	>&2 echo "$(basename $0): Multiple [$1.sh] exist!!"
	>&2 echo "$aux_return"
	set -- $aux_return
	aux_return=$1
elif [[ $aux_array_count -ne 1 ]]; then
	return 1
fi

unset aux_target_basename
unset aux_command_array
unset aux_array_count
