if [ $# -lt 1 ]; then
  git add --all &&
    git commit --amend --no-edit &&
    git push -f
elif [ $# -lt 2 ]; then
  git add --all &&
    git commit --amend -m "$1" &&
    git push -f
else
  echo 'usage : gitamendpush [<commit message>]'
  return 1
fi
