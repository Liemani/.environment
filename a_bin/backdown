#!/bin/zsh

if [[ $# -ne 0 ]]; then
	repositories=($@)
	repositories=(${repositories/#/$git\/})
else
	repositories=($(find $git -depth 1 -type d))
fi

aux pull $repositories



. $env/gitdata.sh

for repository in $repositories; do
	if [[ ! -d $git/$repository ]]; then
		echo -n "\n\n\n"
		git clone git@github.com:$git_user_id/$repository.git $git/$repository \
			|| git clone https://github.com/$git_user_id/$repository.git $git/$repository
	fi
done
