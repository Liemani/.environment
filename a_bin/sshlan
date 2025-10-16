# ssh to local network device with mac address
# store ip address to /tmp/.environment/ipaddress/

if [ $# -ne 1 ]; then
  echo 'usage : sshlan <mac address>'
  return 1
fi



temp_ip_address_directory=/tmp/.environment/ip_address
if [ ! -e "$temp_ip_address_directory/$1" ]; then
  if [ ! -e $temp_ip_address_directory ]; then
    mkdir -p $temp_ip_address_directory
  fi

  dst_ip_address=`arp -a | grep $1 | cut -d' ' -f2 | tr -d '()'`

  if [ -z "$dst_ip_address" ]; then
    echo arp ip address is not found. ping local network ip addresses.
    src_ip_address=`ipconfig getifaddr en1`
    local_network_prefix=`echo "$src_ip_address" | cut -d . -f 1-3`.
    for i in {1..254}; do
      ping -c 1 -t 1 $local_network_prefix$i
    done
  fi

  dst_ip_address=`arp -a | grep $1 | cut -d' ' -f2 | tr -d '()'`

  if [ -z "$dst_ip_address" ]; then
    echo failed getting ip address of $1
    return 1
  fi

  echo $dst_ip_address > $temp_ip_address_directory/$1
fi


ssh `whoami`@`cat $temp_ip_address_directory/$1`
