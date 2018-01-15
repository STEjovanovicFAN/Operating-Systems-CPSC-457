#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//start the program
//int argc counts how many arguments the  user put in
//char* arg[] this takes the a
int main(int argc, char* argv[])
{
  //check if we can use the system
  if(!system(NULL)){
    exit(1);
  }
  //check if user put exactly 1 argument
  if (argc != 2){
    //if lower or higher then 1 argument exit and print message
    printf("%s the command line arguments is not 1 %s\n");
    exit(1);
  }
//make a string
  char temp[20];
  //check if the argument user put in is a directory name
  // [ -d $1]
  strcpy(temp, " [ -d "); // [-d adsada]
  strcat(temp, argv[1]);
  strcat(temp, " ] ");

  //use an int variable to record, if [ -d $1 ] returns as true i =0
  int i = system(temp);
  //check if the value is anything but the zero
  //if it is then exit
  if ( i != 0 ){
      printf("%s the command line arguments is not a directory %s\n");
      exit(1);
  }

  //make a variable of type file
  FILE *file;
  //go into the directory and find all files
  //find $1 -type f | wc -l -this counts all the files in directory
  strcpy(temp, "find ");
  strcat(temp, argv[1]);
  strcat(temp, " -type f | wc -l");

  //stream the data into the type file variable
  file = popen(temp, "r");
  //exit if the streaming went wrong
  if (file == NULL ) exit(1);
  //make it so temp = file-1
  fgets(temp, sizeof(temp)-1, file);

  //temp has a \n in it somewhere, we use this loop to get rid of it
  int f;
  for(f = 0;; f++) {
    if(temp[f] == '\n') {
      temp[f] = '\0';
      break;
    }
  }

  //print output
  printf("%s files inside of directory %s\n", temp, argv[1]);

  //find all the directories same thing as we did with file
  strcpy(temp, "find ");
  strcat(temp, argv[1]);
  strcat(temp, " -type d | wc -l");

  file = popen(temp, "r");
  if (file == NULL) exit(1);

  fgets(temp, sizeof(temp)-1, file);

  for(f = 0;; f++) {
    if(temp[f] == '\n') {
      temp[f] = '\0';
      break;
    }
  }


  printf("%s directories inside of directory %s\n", temp, argv[1]);

  //exit program
  return 0;
}

/*
int main(int argc, char **argv){

//see if there is 1 argument
  if(argc < 2){
    fprintf(stderr, "There needs to be 1 argument\n");
    exit(-1);
  }

  //get the argument in a variable
 //char *arg = argv[1];
 char s[1000];
 strcpy(s, "./dirstat1.sh ");
 strcat(s, argv[1]);


 system(s);
  return 0;
}*/
