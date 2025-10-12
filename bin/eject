# force unmount and eject disk from volume name

if [ $# -ne 1 ]; then
  echo 'usage : eject <volume name>'
  return 1
fi

line_count=$(df | grep $1 | wc -l)

if [ "$line_count" -ne 1 ]; then
  echo 'error : None or too many line is searched'
  df | grep $1
  return 1
fi

volume_device=$(df | grep $1 | awk '{print $1}')
physical_device=$(diskutil info $volume_device | grep "Part of Whole" | awk '{print $4}')
# physical_store=$(diskutil info $volume_device | grep "APFS Physical Store" | awk '{print $4}')

diskutil unmountDisk $volume_device

if [[ $? -ne 0 ]]; then
  diskutil unmountDisk force $volume_device
fi

diskutil eject $physical_device

unset line_count
unset volume_device
unset physical_device
