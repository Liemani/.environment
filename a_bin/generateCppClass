#!/bin/bash

#	usage: aux generate_c_structure <class name> <path>
if [[ $# -eq 1 ]]; then
	2=$(pwd)
elif [[ $# -eq 2 ]]; then
	if [[ $2[1] != "/" ]]; then
		2=$(pwd)/$2
	fi
else
	echo 'usage: aux generateCppClass <class name> <path>'
	exit 1
fi

if [[ -e $2/$1.hpp ]] || [[ -e $2/$1.cpp ]]; then
	echo "[$2/$1.hpp] or [$2/$1.cpp] is already exists!"
	exit 1
fi

cd $env/.tool
echo uppercase name = $(tr '[:lower:]' '[:upper:]' <<< $1)"\n"class name = $1"\n"instance name = $(tr '[:upper:]' '[:lower:]' <<< ${1:0:1})${1:1} > name.variable

hppfile=$2/$1.hpp
echo hppfile : $hppfile
./variabledText.out templateClass.hpp -o $2/$1.hpp
unset hppfile

cppfile=$2/$1.cpp
echo cppfile : $cppfile
./variabledText.out templateClass.cpp -o $2/$1.cpp
unset cppfile

rm name.variable
