# open vimsession in private/.vimsession

if [ $# -ne 1 ]; then
  echo 'usage : vimsession <identifier>'
  ls $private/.vimsession
  return 1
fi

vim -S $private/.vimsession/$1

