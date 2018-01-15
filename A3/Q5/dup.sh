#!/bin/bash
#Lists identical sub-direcotries under current directory
#Directories are identical if they have identical contents
#Runs by ./dup.sh

#duplicate function
duplicate() {
  #Inserts the amount of files into dir1/dir2
  dir1="$(ls $1 | wc -l)"
  dir2="$(ls $2 | wc -l)"
  #Checks if dir1 and dir2 have same amount of contents
  if [ "$dir1" -ne "$dir2" ]; then
    echo 1
    return
  fi
  #Checks each file and directory of subdirectory1 and subdirectory2 recursively and compares them to see if their contents match
  for subdir in $(ls $1); do
    if [ -d "$1/$subdir" ]; then
      if [ -d "$2/$subdir" ]; then
        #Compares files of both subdirectories
        subdirval=$(duplicate "$1/$subdir" "$2/$subdir")
        if [ "$subdirval" -ne 0 ]; then
          echo 1
          return
        fi
      else
        echo 1
        return
      fi
    elif [ -f "$1/$subdir" ]; then
      if [ ! -f "$2/$subdir" ]; then
        echo 1
        return
      fi
    fi
  done
  echo 0
}

#Error check for user executing file
if [ "$#" -ne 0 ]; then
  echo "File input wrong"
  echo "Requires no arguments"
fi

#Checks subdirectories in current directory and checks if they are identical by calling duplicate
#Decides if directories are identical
for dir1 in $(ls -1d */); do
  for dir2 in $(ls -1d */); do
    if [ "$dir1" != "$dir2" ]; then
      var=$(duplicate "$dir1" "$dir2")
      if [ "$var" -eq 0 ]; then
        echo "$dir1 and $dir2 are identical"
      fi
    fi
  done
done
