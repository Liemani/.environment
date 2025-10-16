#!/bin/bash

# generate assembly code for x86_64 from c file

if [[ $# -ne 1 ]]; then
	echo 'usage: aux compilex <filename>'
    exit 1
fi

clang -o ${1%.*}.s -S $1 -O1 -target x86_64-apple-macos10.12
