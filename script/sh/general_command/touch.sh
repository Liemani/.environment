if [ $# -ne 1 ]; then
  echo 'usage : touch <file>'
  echo '  `file` is relative path from $script/sh'
  return 1
fi

touch "$script/sh/$1" &&
  a ln "$1"
