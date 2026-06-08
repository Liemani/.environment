# override
alias codex='codex --sandbox workspace-write --ask-for-approval never'
alias cp='cp -Rip'	# prevent silent overwriting
alias ed='ed -p "command > "'
alias ls='ls -AF1'
alias less='less -S'
alias mv='mv -i'	# prevent silent overwriting
alias vim='a _vim'

alias list='ls -al | command grep -v -e '\''\.DS_Store'\'' | sort -k1,1r -k9,9'

function cd() {
  builtin cd $@
  list
}

# general alias
alias a='. a'
alias lsvs='ls $PRIVATE/.vimsession'
alias today='date "+%C%y%m%d"'
alias timestamp='date "+%Y-%m-%d %H:%M:%S"'
alias disklist='diskutil list'
# cd
alias cde='cd $ENVHOME'
alias cdr='cd $(git rev-parse --show-toplevel)'
alias cdtemp='mkdir /tmp/$(today); cd /tmp/$(today)'
# git
alias gitlog='git log --graph --max-count=21 --pretty=format:"%C(auto)%h%d %C(magenta)%<(6,trunc)%an %C(dim white)%ad %C(reset)%<(80,trunc)%s" --date=short'
alias gitlogall='gitlog --all --max-count=-1'
alias gits='git status && gitlog'

# a_script
alias dump='a dump'
alias record='a record'

## script
alias shrc='. $HOME/.'"$shell"'rc'

## cat
alias catleases='cat /private/var/db/dhcpd_leases'
alias cathosts='sudo cat /etc/hosts'

## vim
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

# simple
alias dockerps="docker ps -a --format 'table {{.Names}}\t{{.Status}}'"

# log
# alias self='basename $(git rev-parse --show-toplevel)'
# alias gitlog='git log --all --graph --oneline'
# alias vimgitlog='vim <(git log --all --graph --oneline)'
# alias clang42='clang -Wall -Wextra -Werror'
# alias clang++42='clang++ -std=c++98 -Wall -Wextra -Werror -I $git/cpp-library -L $git/cpp-library -l cpp-library'
# alias norminetter='norminette -R CheckForbiddenSourceHeader'
# alias setenv='. $env/setenv.sh'
# alias aux='. $aux/foundation/aux.sh'
# alias vim='aux _vim'
# alias ls='ls -Ap1 --color'
# alias a='$ENVIRONMENT/bin/a'
# alias list='ls -al1 | grep -v -e '\''\.swp'\'' -e '\''\.DS_Store'\'' | sort -k1,1r -k9,9'
# alias gemini='builtin cd $ENVHOME/3_archive/zz_gemini && command gemini'
# alias gitlog='git log --all --graph --max-count=42 --oneline'
# alias gitlog='git log --all --graph --max-count=42 --decorate --pretty=format:"%C(yellow)%h %C(cyan)%<(6,trunc)%an %C(green)%ad %Creset%s" --date=short'
# alias gitlog='git log --all --graph --max-count=42 \
#   --decorate=short --color=always \
#   --pretty=format:"%C(yellow)%h %C(magenta)%d %C(cyan)%<(6,trunc)%an %C(green)%ad %Creset%s" \
#   --date=short'
