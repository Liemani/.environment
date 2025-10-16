#!/bin/zsh

if [[ $# -ne 0 ]]; then
	echo 'usage: aux $0'
	echo
	echo 'Check norminette for all .[ch] files in this directory recursively.'
	exit 1
fi

norminette $(find . -name "*.[ch]")
