if [ $# -ge 2 ]; then
	echo 'usage : gitcommit [<commit message>]'
	return 1
fi

if [ $# -eq 0 ]; then
    set -- 'backup'
fi

echo
echo
echo
# echo 'path: $personal/'"${PWD#$personal}"
echo 'path: '"$PWD"

git add --all &&
    git commit -m "$1"
