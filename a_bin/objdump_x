#!/bin/bash

# generate objdump file for x86_64 from c file or assembly code or object file

if [[ $# -ne 1 ]]; then
    echo 'usage: aux objdump_x <filename>'
    exit 1
fi

basename=${1%.*}
extension=${1##*.}

if [[ extension == "c" || extension == "s" ]]; then
    clang -o .$basename.o -c $basename.c -O1 -target x86_64-apple-macos10.12
    objdump -D -S .$basename.o > $basename.objdump
    rm .$basename.o
else
    objdump -D -S $1 > $basename.objdump
fi


unset extension
unset basename
