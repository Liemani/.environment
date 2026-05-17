#!/bin/bash

dst=$ENVHOME/3_project/zz_note_personal/log.txt

printf "[%s] " "`date '+%Y-%m-%d %H:%M:%S'`" >> "$dst"

cat - >> "$dst"
