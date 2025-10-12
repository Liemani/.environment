# vim (grep interface file_python)

if [ $# -lt 1 ]; then
  echo 'usage : viminterfacepython <file_python>'
  return 1
fi

vim <(grep -E "^[[:space:]]*(class|def)" $1)
