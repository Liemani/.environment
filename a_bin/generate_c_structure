#!/bin/bash

if [[ $# -eq 1 ]]; then
	2=$(pwd)
elif [[ $# -eq 2 ]]; then
	if [[ $2[1] != "/" ]]; then
	else
		2=$(pwd)/$2
	fi
else
	echo 'usage: aux generate_c_structure <structure_name> <path>'
	exit 1
fi

if [[ -e $2/$1.h ]] || [[ -e $2/$1.c ]]; then
	echo "[$2/$1.h] or [$2/$1.c] is already exists!"
	exit 1
fi

cd $env/.tool
echo uppercase name = $(tr '[:lower:]' '[:upper:]' <<< $1)"\n"lowercase name = $1 > name.variable
./variabledText.out template.h -o $2/$1.h
./variabledText.out template.c -o $2/$1.c
rm name.variable
