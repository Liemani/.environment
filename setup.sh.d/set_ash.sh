#!/bin/ash

run_ashrc_source=$ENVIRONMENT/copy_source/run_ashrc.sh
run_ashrc_destination=/etc/profile.d/run_ashrc.sh
if [ ! -f "$run_ashrc_destination" ]; then
    cp $run_ashrc_source $run_ashrc_destination
fi
