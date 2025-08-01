# general command
alias a='. $environment/bin/a'
# alias ls='ls -Ap1 --color'
alias ls='ls -Ap1'
alias mv='mv -i'	# prevent silent overwriting
alias cp='cp -Rip'	# prevent silent overwriting
alias list='ls -al | grep -v -e '\''\.swp$'\'' -e '\''^\.DS_Store$'\'' | sort -k1,1r -k9,9'
alias today='echo 20$(date '\''+%y%m%d'\'')'
alias disklist='diskutil list'
alias catleases='cat /private/var/db/dhcpd_leases'
alias heredoc='cat << EOF >>'
alias gemini='builtin cd $ENVHOME/gemini && gemini'
# cd
alias cde='cd $ENVHOME'
alias cdr='cd $(git rev-parse --show-toplevel)'
alias cdtemp='mkdir /tmp/$(today); cd /tmp/$(today)'
# git
alias gitlog='git log --all --graph --max-count=42 --oneline'
alias gitlogall='git log --all --graph --oneline'
alias gitd='git status && gitlog'

# a::command
alias dump='a dump'
alias record='a record'
alias vim='a _vim'
alias vimregister='vim $ENVHOME/0_areas/work_note/register.txt'
alias vs='a vimsession'
alias ed='ed -p "command > "'

## script
alias shrc='. $HOME/.'"$shell"'rc'

## vim
alias vimvimrc='vim $environment/data/.vimrc'
alias vimgitignore='vim $environment/data/.gitignore'
alias vimrecord='vim $personal/.private/record.txt'
alias vimdump='vim $private/dump.txt'
alias vimalias='vim $environment/data/alias.sh'
alias vimknownhosts='vim ~/.ssh/known_hosts'
alias vimactivate='vim $environment/activate.sh'

# function
function cd() {
  builtin cd $@
  list
}

# out-dated
# alias self='basename $(git rev-parse --show-toplevel)'
# alias gitlog='git log --all --graph --oneline'
# alias vimgitlog='vim <(git log --all --graph --oneline)'
# alias clang42='clang -Wall -Wextra -Werror'
# alias clang++42='clang++ -std=c++98 -Wall -Wextra -Werror -I $git/cpp-library -L $git/cpp-library -l cpp-library'
# alias norminetter='norminette -R CheckForbiddenSourceHeader'
# alias setenv='. $env/setenv.sh'
# alias aux='. $aux/foundation/aux.sh'
# alias vim='aux _vim'
