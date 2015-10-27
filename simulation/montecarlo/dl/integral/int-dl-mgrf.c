#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
long double x;						//x coordinate
long double y;						//y coordinate
long double xs[1000000];				//x array
long double h;						//height of gaussian at random x value
int k;						        //counter keeping track of array slots
int i;							//counter for each iteration
int j;							//counter for number of cycles chosen
long double inp;					//number of cycles
long double big;
int conti;
int multi;
long double a = 0.99779845;
long double b = -2.0922585;
long double c = 1.5159574;
long double d = -0.35073568;
int n;

void counter(long double * array){
     FILE *fp;
     char output[]="int-mgrfs.dat";
     int q;

     fp=fopen(output,"w");
     
     for(q=0;q<1000000;q++) {
       if (array[q] != 0){
	 fprintf(fp,"%Lf\n",array[q]);
       }
     }
     fclose(fp);
}

int main() {
  printf ("Monte Carlo Data Generator for Maser Group Fluxes\n");
     for (i=0;i<1000000;i++){				//calculations per cycle
        x = (.14*rand()/RAND_MAX)*10 + 0.8;		//random x between 0.9 and 2.2
	//printf ("x %Lf \n",x);
        y = .10*rand()/RAND_MAX;			//random y between 0 and .15
	//printf ("y %Lf \n",y);
        h = a + b*x + c*x*x + d*x*x*x;
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
  printf ("\nThe data points have been saved to int-mgrfs.dat \n");
 return 0;
}
