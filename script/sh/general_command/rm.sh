if [ $# -ne 1 ]; then
  echo 'usage : rm <file>'
  echo '  file is relative path from $shellscript'
  return 1
fi

basename=$(basename "$1")
filename=${basename%.*}

rm "$shellscript/$1"
rm "$bin/$filename"
