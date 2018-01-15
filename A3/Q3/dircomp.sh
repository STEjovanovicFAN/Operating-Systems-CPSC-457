#!/bin/bash
#get the 2 path names
#get the files for both path names
#get the dir for both path names
#compare and print which one has more files and same thing with directories

if [ "$#" -ne 2 ];
then
  echo "There should be 2 command line arguments"

else
  #2 ARGUMENTS IT TAKES IN
  PATH1=$1
  PATH2=$2

  #file counter for PATH1 and PATH2
  file1=0
  file2=0

  #directory counter for PATH1 and PATH2
  dir1=0
  dir2=0

  #check if path1 is not a directory
  if [ -d $PATH1 ]
  #do nothing
   then
     echo ""

  #not a directory and exit the program
  else
    echo "pathname_of_$PATH1 does not exist or it is not a directory"
    exit 1
  fi

  #check if path2 is not a directory
  if [ -d $PATH2 ]
  #do nothing
   then
     echo ""

  #not a directory and exit the program
  else
    echo "pathname_of_$PATH2 does not exist or it is not a directory"
    exit 1
  fi

  #get the amount of files and directoires in PATH1
  #do a do while loop to count the amount of things in the argument directory
  for things in $PATH1/*
  do
  #if the thing is a file
  if [[ -f "$things" ]]
   #file = file +1
   then
     file1=$[$file1+1]

   #else if the thing is a file
  elif [[ -d "$things" ]]
    #dir = dir +1
    then
      dir1=$[$dir1+1]

  #finish loop
  fi
  done

  #get the amount of files and directoires in PATH2
  #do a do while loop to count the amount of things in the argument directory
  for things in $PATH2/*
  do
  #if the thing is a file
  if [[ -f "$things" ]]
   #file = file +1
   then
     file2=$[$file2+1]

   #else if the thing is a file
  elif [[ -d "$things" ]]
    #dir = dir +1
    then
      dir2=$[$dir2+1]

  #finish loop
  fi
  done

  #compare the files with one another and print out which one has more files
  if [ "$file1" -gt "$file2" ]
  then
    echo "pathname_of_dir1 has more files than pathname_of_dir2"

  else
    echo "pathname_of_dir2 has more files than pathname_of_dir1"

  fi

  if [ "$dir1" -gt "$dir2" ]
  then
    echo "pathname_of_dir1 has more directories than pathname_of_dir2"

  else
    echo "pathname_of_dir1 has more directories than pathname_of_dir2"

  fi
fi
