# list private vimsession

if [ $# -ne 0 ]; then
    echo 'usage : vimsession'
    return 1
fi

base=$private/.vimsession

ls $base

unset base
