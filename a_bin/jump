# jump to mark in file system

if [ $# -lt 1 ]; then
    mark='temp'
elif [ $# -lt 2 ]; then
    mark=$1
else
    echo 'usage : jump [<mark>]'
    return 1
fi

mark="a_mark_$mark"
eval "a_mark_path=\$$mark"
cd $a_mark_path

unset mark
