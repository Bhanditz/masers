#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
long double x;						//x coordinate
long double y;						//y coordinate
long double xs[250000];				//x array
long double h;						//height of gaussian at random x value
int k;						//counter keeping track of array slots
int i;							//counter for each iteration
int j;							//counter for number of cycles chosen
long double inp;					//number of cycles
long double big;
int conti;
int multi;
long double a = 1290.6618;
long double b = 378.81538;
long double c = 36.094707;
long double d = 1.1073411;
int n;
void counter(long double * array){
     FILE *fp;
     char output[]="cgrfs.dat";
     int q;

     fp=fopen(output,"w");
     
     for(q=0;q<250000;q++) {
        fprintf(fp,"%Lf\n",array[q]);
     }
     fclose(fp);
}
int main() {
  printf ("\n=====================================================================================\n");
  printf ("----------------- Monte Carlo Data Generator for Maser Group Fluxes -----------------\n");
     for (i=0;i<1000000;i++){				//calculations per cycle
        x = - 5.5*rand()/RAND_MAX - 9.5;		//random x between -15 and -9.5
	//printf ("x %Lf \n",x);
        y = 1.5*rand()/RAND_MAX;			//random y between 0 and 15
	//printf ("y %Lf \n",y);
        h = (a + b*x + c*x*x + d*x*x*x)/10;
	//printf ("h %Lf \n",h);
        if (h >= y){				        //under curve?
	  //printf ("yes \n");
  	  k++;                                          //select next array slot
	  xs[k] = x;                                    //save x into slot
        }
      }

     //for(n = 0; n <= 239000; n++) {
     //printf("%Lf ", xs[n]);
     //}
  printf ("\n");
  /*  FILE *p;
  if((p=fopen("mgrfs.dat","wb"))==NULL){
      printf("\nUnable to open file myfile.dat");
      exit(1);
  }
  fwrite(xs,sizeof(xs),1,p);
  fclose(p);*/
  counter(xs);
  printf ("\nThe data points have been saved to cgrfs.dat \n");
 return 0;
}
