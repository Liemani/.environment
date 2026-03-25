. $ENVIRONMENT/data/variable.sh
cat $ENVIRONMENT/copy_source/sh.rc >> $HOME/.$shell'rc'
sed -i'' "s|\$ENVIRONMENT|$ENVIRONMENT|" $HOME/.$shell'rc'
