#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <tgmath.h>


int i = 0;
double xap;
int n;
double xray[100];
double maser[100];
double nh[100];


void counter(double * array){
     FILE *fp;
     char output[]="simulated_nh.dat";
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
   static const char filename[] = "temp/xray.dat";
   FILE *file = fopen ( filename, "r" );
   if ( file != NULL )
   {
      char line [ 128 ]; // or other suitable maximum line size

      while ( fgets ( line, sizeof line, file ) != NULL ) // read a line
      {
	    sscanf (line, "%lf", &xap);
        xray[i] = xap; // write the line
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
   static const char filename1[] = "temp/maser.dat";
   FILE *file1 = fopen ( filename1, "r" );
   if ( file1 != NULL )
   {
      char line [ 128 ]; // or other suitable maximum line size

      while ( fgets ( line, sizeof line, file1 ) != NULL ) // read a line
      {
	    sscanf (line, "%lf", &xap);
        maser[i] = xap; // write the line
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
		//printf("%d %lf %lf %lf\n",i,xray[i],maser[i],nh[i]);
   }
   counter(nh);
   return 0;
}