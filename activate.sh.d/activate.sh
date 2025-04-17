# source data scripts
# source additional activate script
# source shell specific scripts

. $environment/data/variable.sh
. $environment/data/alias.sh
. $environment/data/rc.sh

. $environment/activate.sh.d/set_viminit.sh

apply_sh_script=$environment/activate.sh.d/apply_$shell.sh
if [ -f "$apply_sh_script" ]; then
  . $apply_sh_script
fi
unset apply_sh_script
