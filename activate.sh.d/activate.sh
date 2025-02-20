. $environment/data/variable.sh
. $environment/data/alias.sh
. $environment/data/rc.sh

apply_sh_script=$environment/activate.sh.d/apply_$shell.sh

if [ -f "$apply_sh_script" ]; then
  . $apply_sh_script
fi
