#!/bin/sh

if [ $# -ge 2 ]; then
    echo 'usage : gitpush [<commit message>]'
    return 1
fi

a gitcommit "$@"
git push
