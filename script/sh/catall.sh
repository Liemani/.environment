# cat all files
# example:
# catall txt

if [ $# -ne 1 ]; then
  echo 'usage : catall <extension>'
  exit 1
fi

find . -name "*.$1" -exec echo catall {}: \; -exec cat {} \; -exec echo \;
