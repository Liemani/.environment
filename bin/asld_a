#!/bin/bash

# generate excutable file of AArch64 from assembly file

if [[ $# -ne 1 ]]; then
	echo 'usage: aux asld_a <file>'
    return 1
fi

if [[ ${1##*.} != "s" ]]; then
    echo $1 'has wrong extension'
    return 1
fi

basename=${1%.s}

as -arch arm64 -o $basename.o $basename.s &&
#   ld -o $basename $basename.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64
ld -o $basename $basename.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -arch arm64

unset basename
