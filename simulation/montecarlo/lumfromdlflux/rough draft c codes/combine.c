#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

const int biglong = 10;

int mygetline ( char s[], int lim ) {
  int c, i;
  i = 0;
  while( --lim > 0 && (c = getchar()) != EOF && c != '\n' )
  s[i++] = c;
  if ( c == '\n' )
  s[i++] = c;
  s[i] = '\0';
  return i ;
 }

int main () {
	printf("enter the dl file name");
	filenameinput = stdin;
	FILE *fp
	fp = fopen(filenameinput, "r");
	
	double array[biglong];
	int i;
    const int maxline = 10000;
    int nl, length;
    char line[maxline];
    double value ; 
    nl = 0;
    while ( ( length = mygetline( line, maxline ) ) != 0 ) //avoiding blanks
          {
              sscanf( line, "%lf", &value, fp ) ; 
              printf( "%lf %lf\n", value ,value*value ) ; //trying to output x & x*x
			  array[1,i] = value;
			  i++;
           } 
	//for (i = 0; i < biglong; i++) {
		//printf("%lf ", array[i]);
	//}
	
}
/*
int main() {
	int i;
	double dl[biglong] = myreadfile();
	for (i = 0; i < biglong; i++) {
		printf("%lf ", dl[i]);
	}
} */