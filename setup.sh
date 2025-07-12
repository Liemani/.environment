# usage : $SHELL setup.sh
basedir=`dirname $0`

. $basedir/data/path.sh
. $basedir/data/variable.sh

# run script with matching shell
# observation : mac run bash when run script with "sh" command but $SHELL has zsh
$SHELL $basedir/setup.sh.d/setup.sh
