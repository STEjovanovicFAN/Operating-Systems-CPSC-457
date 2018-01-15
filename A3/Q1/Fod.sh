#!/bin/bash
#Take in an argument
#3 Choices 1)argument is a file 2)argument is a directory 3)argument does not exist in current directory


#check if the arugments are equal to 1
#if not exit with an error message
if [ "$#" -ne 1 ];
then
  echo "There should be 1 command line argument"

else
  #pass the command line argument to a variable name
  ARGUMENT=$1

  #check if the variable is a file
  if [[ -f $ARGUMENT ]];
  #if it is print it is a file
  then
    echo "Argument is a file"

  #check if the variable is a directory
  elif [[ -d $ARGUMENT ]]
  #if it is print it is a directory
  then
    echo "Argument is a directory"

  #if it isnt a file or directory it does not exist
  else
    echo "Argument does not exist in current directory"
  fi
fi
