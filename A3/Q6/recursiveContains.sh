#!/bin/bash
#get the 2 arguments
#go into first argument directory and see if second argument directory is in it-if it is display "relationship"
#go into second argument directory and see if second argument directory is in it - if it is display "relationship
#otherwise there is no relationship and return that there is no relationship between arument 1 and argument 2

noRelation=0
# $1 - directory to search
# $2 - path that you are looking at
# $3 - directory you are looking for
contains() {
  if [ -d "$2" ]; then
    if [ -d "$2/$3" ]; then
      echo "$1 contains $3 with the path $2/$3"
      noRelation=1
    fi
  else
    return
  fi

  for subdir in $(ls $2); do
    if [ -d "$2/$subdir" ]; then
      contains "$1" "$2/$subdir" "$3"
    fi
  done
}

contains $1 $1 $2
contains $2 $2 $1

if [ "$noRelation" -eq 0 ]; then
  echo "there is no relationship between $1 and $2"
fi
