#!/bin/bash

dst=$ENVHOME/1_area/work_note/log.txt

printf "[%s] " "`date '+%Y-%m-%d %H:%M:%S'`" >> "$dst"

cat - >> "$dst"
