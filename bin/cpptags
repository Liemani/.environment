#!/bin/zsh



if [[ $# -eq 0 ]]; then
    1='.'
elif [[ $# -ne 1 ]]; then
	echo 'usage: aux cpptags <directory to analyze>'
	exit 0
fi



/opt/homebrew/Cellar/ctags/5.8_2/bin/ctags -a -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ $1
