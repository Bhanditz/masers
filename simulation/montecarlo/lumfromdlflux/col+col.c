#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <tgmath.h>


int i = 0;
double x;
int n;
double dl[1000000];
double flux[1000000];
double lum[1000000];


void counter(double * array){
     FILE *fp;
     char output[]="calculated_luminosity.dat";
     int q;

     fp=fopen(output,"w");
     
     for(q=0;q<1000000;q++) {
       if (array[q] > 0){
	 fprintf(fp,"%lf\n",array[q]);
       }
     }
     fclose(fp);
}

int main ( void )
{
   static const char filename[] = "dlinput.dat";
   FILE *file = fopen ( filename, "r" );
   if ( file != NULL )
   {
      char line [ 128 ]; // or other suitable maximum line size

      while ( fgets ( line, sizeof line, file ) != NULL ) // read a line
      {
	    sscanf (line, "%lf", &x);
        dl[i] = x; // write the line
		i++;
      }
      fclose ( file );
   }
   else
   {
      perror ( filename ); // why didn't the file open?
   }
   n = i;
   i = 0;
   static const char filename1[] = "fluxinput.dat";
   FILE *file1 = fopen ( filename1, "r" );
   if ( file1 != NULL )
   {
      char line [ 128 ]; // or other suitable maximum line size

      while ( fgets ( line, sizeof line, file1 ) != NULL ) // read a line
      {
	    sscanf (line, "%lf", &x);
        flux[i] = x; // write the line
		i++;
      }
      fclose ( file1 );
   }
   else
   {
      perror ( filename1 ); // why didn't the file open?
   }
   int m = i;
   if (n > m) {n = m;}
   for (i=0; i<n; i++){
		lum[i] = log10(4*3.14159265359*(pow(10,2*dl[i]))*(pow(10,flux[i]))*pow((3.08567758*pow(10,24)),2));
		//printf("%d %lf %lf %lf\n",i,dl[i],flux[i],lum[i]);
   }
   counter(lum);
   return 0;
}