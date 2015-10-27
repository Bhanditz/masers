#include <stdio.h>
#include <time.h>
#include <math.h>
long double x;						//x coordinate
long double y;						//y coordinate
long double xs[100];				//x array
long double h;						//height of gaussian at random x value
int k;						//counter keeping track of array slots
int i;							//counter for each iteration
int j;							//counter for number of cycles chosen
long double inp;					//number of cycles
long double big;
int conti;
int multi;
long double a = 252.09065;
long double b = 75.267500;
long double c = 7.2644360;
long double d = 0.22528820;
int n;
int main() {
  printf ("\n=====================================================================================\n");
  printf ("----------------- Monte Carlo Data Generator for Maser Group Fluxes -----------------\n");
  printf ("Please indicate the number of calculation cycles (10^6 calculations each) you desire.\n");
  printf ("Choose a value and press enter:\n");
  //scanf ("%Lf",&inp);					//accept numerical input
  //  while (conti == 0){
  //for (j=0;j<inp;j++){				//main loop to repeat cycles according to input
      for (i=0;i<100;i++){				//10^6 calculations per cycle
        x = 5.5*rand() + 9.5;				//random x between -15 and -9.5
        y = 15*rand();				        //random y between 0 and 15
        h =  a + b*x + c*x*x + d*x*x*x;
        if (h >= y){				        //under curve?
  	  k++;                                          //select next array slot
	  xs[k] = x;                                    //save x into slot
        }
      }
      //}
    //    printf ("\nWould you like to continue this process? If you choose to do so, this will enable you\n");
    //printf ("to continue using the data you have already compiled and combine it with new data. If\n");
    //printf ("this is what you would like, please enter 0 and the same number of loops will repeat.\n");
    //printf ("If you would like to finish, please enter any other number.\n");
    //scanf ("%d",&conti);				//scan input
    //    if (conti == 0){					//add to multiplier for counter in display
    //  conti++;
    //}
    //}
  printf ("\nThe data points have been saved to ... ");
  for(n = 0; n <= k; i++) {
    printf("%Lf ", xs[n]);
  }
 return 0;
}
