#!/bin/zsh

binaries=($(echo $1 | tr -d " "))
for binary in $binaries; do
	sum=$((sum + 2#$(echo $binary | rev)))
done

result=$(echo "obase=2; $sum" | bc)
index=$((32 - $#result))

echo result: $result

if [[ $#result -le 32 ]]; then
	index=0;
else
	index=$(($#result - 32))
fi

while [[ index -lt $#result ]]; do
	ch=${result:$index:1}
	if [[ $ch == "1" ]]; then
		error=true;
	fi
	echo -n $ch
	index=$((index + 1))
done

echo
if [[ $error != true ]]; then
	echo '[OK]'
else
	echo '[KO]'
fi
