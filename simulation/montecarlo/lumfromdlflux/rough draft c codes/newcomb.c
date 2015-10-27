#include <stdio.h>

int i = 0;
double x;
int n;
double array[10];


int main ( void )
{
   static const char filename[] = "dlsample.dat";
   FILE *file = fopen ( filename, "r" );
   if ( file != NULL )
   {
      char line [ 128 ]; // or other suitable maximum line size

      while ( fgets ( line, sizeof line, file ) != NULL ) // read a line
      {
        array[i] = fputs ( line, stdout ); // write the line
		i++;
      }
      fclose ( file );
   }
   else
   {
      perror ( filename ); // why didn't the file open?
   }
   n = i;
   for (i=0; i<n; i++){
		printf("%lf\n",array[i]);
   }
   return 0;
}