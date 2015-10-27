#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <tgmath.h>


int i = 0;
double x;
int n;
double total;
double ave;

int main (  )
{
   static const char filename[] = "aveinput.dat";
   FILE *file = fopen ( filename, "r" );
   if ( file != NULL )
   {
      char line [ 128 ]; // or other suitable maximum line size

      while ( fgets ( line, sizeof line, file ) != NULL ) // read a line
      {
	    sscanf (line, "%lf", &x);
        total = total + x; // write the line
		i++;
      }
      fclose ( file );
   }
   else
   {
      perror ( filename ); // why didn't the file open?
   }
   ave = total/i;
   printf ("The average value of aveinput.dat is %lf\n",ave);
   return ave;
}