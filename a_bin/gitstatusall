if [ $# -ne 0 ]; then
    echo 'usage : gitstatusall'
    return 1
fi

oldpwd=$PWD



cd $personal
a gitstatus $(ls)



cd $oldpwd

unset oldpwd
