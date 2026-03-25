# source data scripts
# source additional activate script
# source shell specific scripts

PATH=$PATH:$ENVIRONMENT/bin

. $ENVIRONMENT/data/variable.sh
. $ENVIRONMENT/data/alias.sh
. $ENVIRONMENT/activate.sh.d/set_viminit.sh

apply_sh_script=$ENVIRONMENT/activate.sh.d/apply_$shell.sh
if [ -f "$apply_sh_script" ]; then
  . $apply_sh_script
fi
unset apply_sh_script

# prevent ctrl-s from suspending

if [[ $SHELL =~ .*/zsh ]]; then
  stty -ixon
  autoload compinit
  compinit
fi
