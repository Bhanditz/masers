#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <tgmath.h>


int i = 0;
double x;
int n;
double nh[1000000]; 
double flake[1000000];              // this is a fake version of flux calculated as luminosity divided by 10^42


int main ( void )
{
   static const char filename[] = "nh.dat";
   FILE *file = fopen ( filename, "r" );
   if ( file != NULL )
   {
      char line [ 128 ]; // or other suitable maximum line size

      while ( fgets ( line, sizeof line, file ) != NULL ) // read a line
      {
	    sscanf (line, "%lf", &x);
        nh[i] = pow(10,x); // get rid of log scale
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
	static const char filename1[] = "lum.dat";
	FILE *file1 = fopen ( filename1, "r" );
	if ( file1 != NULL )
	{
      char line [ 128 ]; // or other suitable maximum line size

      while ( fgets ( line, sizeof line, file1 ) != NULL ) // read a line
      {
	    sscanf (line, "%lf", &x);
        flake[i] = pow(10,(x-42)); // calculate fake flux as luminosity divided by 10^42 and make power to get rid of log scale
		i++;
      }
      fclose ( file1 );
	}
	else
	{
      perror ( filename1 ); // why didn't the file open?
	}
	
    FILE *fp;
    char output[]="pimmput.xco";
    int q;
    fp=fopen(output,"w");
	fprintf(fp,"log /users/drewnutter/gdrive/jmu/astrores/su13/simulation/montecarlo/pimms/outpimm.log\n");
	fprintf(fp,"from flux ergs 2-10\n");
	fprintf(fp,"inst flux ergs 2-10 UNABSORBED\n");
    for(q=0;q<1000;q++) {
		if (nh[q] > 0){
			fprintf(fp,"mo po 1.7 %lf\n",nh[q]);
			fprintf(fp,"go %lf\n",flake[q]);
		}
	}
	fprintf(fp,"exit\n");
	fclose(fp);
	return 0;
}