# todo : id / ip
if [[ $# -eq 0 ]]; then
  echo 'usage : send <destination : location> <files : path>'
elif [[ $# -lt 2 ]]; then
  2=$local/send/*
fi

networkAddress=$1
destination=$networkAddress:/home/a/local/receive

shift

scp -r $@ $destination

unset networkAddress
unset destination
