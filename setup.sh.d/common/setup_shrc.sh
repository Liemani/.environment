. $environment/data/variable.sh
cat $environment/copy_source/sh.rc >> $HOME/.$shell'rc'
sed -i'' "s|\$environment|$environment|" $HOME/.$shell'rc'
