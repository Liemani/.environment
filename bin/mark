# mark current directory for jump

if [ $# -lt 1 ]; then
    mark='temp'
elif [ $# -lt 2 ]; then
    mark=$1
else
    echo 'usage : mark [<mark>]'
    return 1
fi

export "a_mark_$mark"=$PWD

unset mark
