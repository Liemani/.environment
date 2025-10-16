if [ $# -ge 2 ]; then
    echo 'usage : gitamend [<commit message>]'
    return 1
fi

if [ $# -eq 0 ]; then
    git add --all &&
        git commit --amend --no-edit
elif [ $# -eq 1 ]; then
    git add --all &&
        git commit --amend -m "$1"
fi
