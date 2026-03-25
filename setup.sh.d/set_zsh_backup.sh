#!/bin/zsh

. $base_directory/.data/.zshrc



if [[ ! -e $remote ]]; then
	echo source $data/.zshrc >> $HOME/.zshrc
	echo source $data/.vimrc >> $HOME/.vimrc
fi



backbone_path_list=(
	$remote
	$local
	)

for backbone_path in $backbone_path_list; do
	if [[ ! -d $backbone_path ]]; then
		mkdir $backbone_path
	fi
done

unset backbone_path_list
unset backbone_path



if [[ ! -d $env ]]; then
	env_tmp=$(dirname $0)
	if [[ $env_tmp =~ "\." ]]; then
		env_tmp="$(pwd)"
	elif [[ ! $env_tmp =~ ^/ ]]; then
		env_tmp=$(pwd)/$env_tmp
	fi

	mv $env_tmp $remote

	unset env_tmp
fi



. $env/gitdata.sh

git config --global user.name $git_user_name
git config --global user.email $git_user_email
git config --global core.excludesFile $data/.gitignore
git config --global alias.pull "git pull --rebase"

if [[ -d $HOME/.ssh ]]; then
	git_address=git@github.com:
else
	git_address=https://github.com/
fi

for repository in $repositories; do
	if [[ ! -d $remote/$repository ]]; then
		echo path: $repository
		git clone $git_address$git_user_name/$repository.git $remote/$repository
		echo
	fi
done



if [[ ! -d $PRIVATE ]]; then
	mkdir $PRIVATE;
fi



unset repositories
unset git_user_name
unset git_user_email
unset git_address
unset repository
