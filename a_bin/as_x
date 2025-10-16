#!/bin/bash

# generate object file for x86_64 from c file or assembly code

if [[ $# -ne 1 ]]; then
	echo 'usage: aux as_x <filename>'
    exit 1
fi

clang -o ${1%.*}.o -c $1 -O1 -target x86_64-apple-macos10.12
