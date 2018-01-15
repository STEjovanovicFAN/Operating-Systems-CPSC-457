#!/bin/bash
#get the 2 arguments
#go into first argument directory and see if second argument directory is in it-if it is display "relationship"
#go into second argument directory and see if second argument directory is in it - if it is display "relationship
#otherwise there is no relationship and return that there is no relationship between arument 1 and argument 2

if [ "$#" -ne 2 ];
then
  echo "There should be 2 command line arguments"

else
  #variables that take in the command line arguments
  Dir1=$1
  Dir2=$2

  var1=0
  var2=0

  #check if first argument is a directory
  if [ -d $Dir1 ]
  then
    cd $Dir1
    #see if it contains directory 2
    var1=$( ls | grep -c $Dir2 )
    if [ $var1 == 1 ]
    then
      echo "$Dir2 is inside of $Dir1"

    else
      echo "NO such relationship exists between $Dir1 and $Dir2"
    fi
  elif [ -d $Dir2 ]
  then
    cd $Dir2
    var2=$( ls | grep -c $Dir1 )
    if [ $var2 == 1 ]
    then
      echo "$Dir1 is inside of $Dir2"

    else
      echo "NO such relationship exists between $Dir1 and $Dir2"
    fi
  else
      echo "Either first argument and/or second argument was not a directory(s)"
  fi
fi
