#!/bin/bash
#take in directory name
#print to screen directory name
#print out the amount of directories and files inside the directory

#check if the command line argument is 1
if [ "$#" -ne 1 ];
then
  echo "There should be 1 command line argument"

else
  ARGUMENT=$1
  #variables to keep track of the amount of files and directories
  file=0
  dir=0

  #print out the .sh file name and the arguments it has
  echo "dirstat $ARGUMENT"

  #do a do while loop to count the amount of things in the argument directory
  for things in $ARGUMENT/*
  do
  #if the thing is a file
  if [[ -f "$things" ]]
   #file = file +1
   then
     file=$[$file+1]

   #else if the thing is a file
  elif [[ -d "$things" ]]
    #dir = dir +1
    then
      dir=$[$dir+1]

  #finish loop
  fi
  done

  #print out the results
  echo "$dir Directories and $file files"
fi
