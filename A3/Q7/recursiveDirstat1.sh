#!/bin/bash

dirstat(){
  filecount=$(find $1 -type f | wc -l)
  dircount=$(($(find $1 -type d | wc -l)-1))
  echo "$dircount directories and $filecount files in $1"

  for subdir in $(ls $1); do
    if [ -d "$1/$subdir" ]; then
      dirstat "$1/$subdir"
    fi
  done
}

dirstat $1
