#!/bin/bash

dst=$ENVHOME/3_project/work/log.txt

printf "[%s] " "`date '+%Y-%m-%d %H:%M:%S'`" >> "$dst"

cat - >> "$dst"
