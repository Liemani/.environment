if [ $# -eq 0 ]; then
    git status
else
    for repository_name in "$@"; do
        echo
        echo
        echo
        echo 'path : $personal/'"$repository_name"
        builtin cd "$personal/$repository_name"
        git status
    done
fi

>/dev/null cd -
