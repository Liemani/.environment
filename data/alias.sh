# general alias
# alias a='$ENVIRONMENT/bin/a'
# alias ls='ls -Ap1 --color'
alias a='. a'
alias ls='ls -AF1'
alias lsvs='ls $PRIVATE/.vimsession'
alias mv='mv -i'	# prevent silent overwriting
alias cp='cp -Rip'	# prevent silent overwriting
# alias list='ls -al1 | grep -v -e '\''\.swp'\'' -e '\''\.DS_Store'\'' | sort -k1,1r -k9,9'
alias list='ls -al | grep -v -e '\''\.DS_Store'\'' | sort -k1,1r -k9,9'
alias today='date "+%C%y%m%d"'
alias timestamp='date "+%Y-%m-%d %H:%M:%S"'
alias disklist='diskutil list'
alias gemini='builtin cd $ENVHOME/3_archive/zz_gemini && command gemini'
# cd
alias cde='cd $ENVHOME'
alias cdr='cd $(git rev-parse --show-toplevel)'
alias cdtemp='mkdir /tmp/$(today); cd /tmp/$(today)'
# git
# alias gitlog='git log --all --graph --max-count=42 --oneline'
# alias gitlog='git log --all --graph --max-count=42 --decorate --pretty=format:"%C(yellow)%h %C(cyan)%<(6,trunc)%an %C(green)%ad %Creset%s" --date=short'
# alias gitlog='git log --all --graph --max-count=42 \
#   --decorate=short --color=always \
#   --pretty=format:"%C(yellow)%h %C(magenta)%d %C(cyan)%<(6,trunc)%an %C(green)%ad %Creset%s" \
#   --date=short'
alias gitlog='git log --all --graph --max-count=42 --pretty=format:"%C(auto)%h%d %C(magenta)%<(6,trunc)%an %C(dim white)%ad %C(reset)%<(80,trunc)%s" --date=short'
alias gitlogall='gitlog --max-count=-1'
alias gits='git status && gitlog'

# a_script
alias dump='a dump'
alias record='a record'
alias vim='a _vim'
alias vs='a vimsession'
alias ed='ed -p "command > "'

## script
alias shrc='. $HOME/.'"$shell"'rc'

## cat
alias catleases='cat /private/var/db/dhcpd_leases'
alias cathosts='sudo cat /etc/hosts'

## vim
alias vimbashrc='vim $ENVIRONMENT/data/.bashrc'
alias vimvimrc='vim $ENVIRONMENT/data/.vimrc'
alias vimgitignore='vim $ENVIRONMENT/data/.gitignore'
alias vimrecord='vim $personal/.private/record.txt'
alias vimdump='vim $PRIVATE/dump.txt'
alias vimalias='vim $ENVIRONMENT/data/alias.sh'
alias vimpath='vim $ENVIRONMENT/data/path.sh'
alias vimknownhosts='vim ~/.ssh/known_hosts'
alias vimactivate='vim $ENVIRONMENT/activate.sh'
alias vimregister='vim $ENVHOME/1_area/work_note/register.txt'
alias vimdata='vim $ENVHOME/1_area/work_note/data.txt'
alias vima='vim $SCRIPT/bin/a'
alias vimsshconfig='vim /Users/bagjeonghun/.ssh/config'
alias vimhosts='sudo vim /etc/hosts'

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
