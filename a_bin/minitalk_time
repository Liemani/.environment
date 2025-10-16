#!/bin/zsh

if [[ $# -ne 3 ]]; then
	echo 'usage: aux minitalk_test <server pid> <string> <count>'
	exit 0
fi



time=0
transfered_bytes=$(($(echo -n $2 | wc -c) * $3))
count=$3
while [[ $count -gt 0 ]]; do
	time=$(($time + $((time ./client $1 $2) 2>&1 | cut -d' ' -f11)))
	# /usr/bin/time -f %e ./client $1 $2 # command time 은 built-in command 이기 때문에 f 옵션을 수행하지 않는다.
	count=$(($count - 1))
done



time=$(printf '%.*f' 3 $time)
transfer_speed=$(printf '%.*f' 0 $((transfered_bytes / $time)))



echo
echo "Time: $time secs"
echo "Transfered bytes: $transfered_bytes bytes"
echo "Transfer speed: $transfer_speed bytes/sec"
