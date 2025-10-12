#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo 'usage: aux vimassembly <path>'
fi

if [[ ${1##*.} == "c" ]]; then
	baseName=${1%.c}
	clang -c -g $1 && objdump -l -S $baseName.o > $baseName.s && vim $baseName.s
elif [[ ${1##*.} == "cpp" ]]; then
	baseName=${1%.cpp}
	clang++ -c -g $1 && objdump -l -S $baseName.o > $baseName.s && vim $baseName.s
fi

unset baseName

# if [[ ${1##*.} == "c" ]]; then
# 	clang -S $1 && vim ${1%.c}.s
# elif [[ ${1##*.} == "cpp" ]]; then
# 	clang++ -S $1 && vim ${1%.cpp}.s
# fi
