#!/bin/bash
#Take in an argument
#3 Choices 1)argument is a file 2)argument is a directory 3)argument does not exist in current directory




fod(){
  #check if the variable is a file
  if [[ -f $1 ]];
  #if it is print it is a file
  then
    echo "$1 is a file"
    return
  #check if the variable is a directory
  elif [[ -d $1 ]]
  #if it is print it is a directory
  then
    echo "$1 is a directory"

  #if it isnt a file or directory it does not exist
  else
    echo "$1 does not exist in current directory"

  fi
  for subdir in $(ls $1); do
    fod "$1/$subdir"

  done

}

fod $1
