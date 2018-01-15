#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv){

//see if there is 1 argument
  if(argc < 2){
    fprintf(stderr, "There needs to be 1 argument\n");
    exit(-1);
  }

  //get the argument in a variable
 //char *arg = argv[1];
 char s[1000];
 //./dirstatre $1
 strcpy(s, "./recursiveDirstat1.sh ");
 strcat(s, argv[1]);

 system(s);
  return 0;
}
