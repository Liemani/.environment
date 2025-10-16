#!/bin/bash

#	usage: aux generate_c_structure <class name> <base class name> <path>
if [[ $# -eq 2 ]]; then
	3=$(pwd)
elif [[ $# -eq 3 ]]; then
	if [[ $2[1] != "/" ]]; then
		3=$(pwd)/$3
	fi
else
	echo 'usage: aux generateCppDerivedFrom <class name> <base class name> <path>'
	exit 1
fi

if [[ -e $3/$1.hpp ]] || [[ -e $3/$1.cpp ]]; then
	echo "[$3/$1.hpp] or [$3/$1.cpp] is already exists!"
	exit 1
fi

cd $env/.tool
#	uppercase name
#	class name
#	instance name
#	base class name
echo uppercase name = $(tr '[:lower:]' '[:upper:]' <<< $1)"\n"class name = $1"\n"instance name = $(tr '[:upper:]' '[:lower:]' <<< ${1:0:1})${1:1}"\n"base class name = $2 > name.variable
./variabledText.out templateDerivedClass.hpp -o $3/$1.hpp
./variabledText.out templateDerivedClass.cpp -o $3/$1.cpp
rm name.variable
