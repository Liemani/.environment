#!/bin/bash

dst=$ENVHOME/3_project/second_brain/areas/log.txt

printf "[%s] " "`date '+%Y-%m-%d %H:%M:%S'`" >> "$dst"

cat - >> "$dst"
