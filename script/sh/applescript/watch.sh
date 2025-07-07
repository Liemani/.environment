if [[ $# -eq 0 ]]; then
  echo 'usage : watch <pid> <notification message>'
  return 1
fi



echo 'Watching' $1

while [[ $? == 0 ]]; do
  sleep 10
  ps $1 >> /dev/null
done

shift

a notification "$*"
