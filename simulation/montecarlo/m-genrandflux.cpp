#include <stdio.h>
#include <time.h>
#include <math.h>
#include <iostream>
#include "boost/random.hpp"
#include "boost/generator_iterator.hpp"
long double x;						//x coordinate
long double y;						//y coordinate
long double xs[1000000];				//x array
long double ys[1000000];				//y array
long double h;						//height of gaussian at random x value
long double k;						//counter keeping track of array slots
int i;							//counter for each iteration
int j;							//counter for number of cycles chosen
long double inp;					//number of cycles
int conti;
int multi;
int a = 252.09065;
int b = 75.267500;
int c = 7.2644360;
int d = 0.22528820;
using namespace std;					//declare standard namespace
int main() {
  printf ("\n=====================================================================================\n");
  printf ("----------------- Monte Carlo Data Generator for Maser Group Fluxes -----------------\n");
  printf ("Please indicate the number of calculation cycles (10^6 calculations each) you desire.\n");
  printf ("Choose a value and press enter:\n");
  scanf ("%Lf",&inp);					//accept numerical input
  typedef boost::mt19937 RNGType;			//boost will use mersenne twister generator
  RNGType rng(time(0));   				//seed using time
  boost::uniform_real<long double> neg2plus(0,1);	//distribution neg2plus is 0 to 1 as long double numbers
  boost::variate_generator< RNGType,                    //bring random number into neg2plus distribution
    boost::uniform_real<long double> > randoo(rng, neg2plus); //define randoo as function using rng seed on neg2plus range
  while (conti == 0){
    for (j=1;j<inp+1;j++){				//main loop to repeat cycles according to input
      for (i=0;i<1000000;i++){				//10^6 calculations per cycle
        x = 5.5*randoo() + 9.5;				//random x between -15 and -9.5
        y = 15*randoo();				//random y between 0 and 15
        h =  a + b*x + c*x^2 + d*x^3
        if (h >= y){				        //under curve?
  	  k++;                                          //select next array slot
	  xs[k] = x;                                    //save x into slot
	  ys[k] = y;                                    //save y into slot
        }
      }
    }
    printf ("\nWould you like to continue this process? If you choose to do so, this will enable you\n");
    printf ("to continue using the data you have already compiled and combine it with new data. If\n");
    printf ("this is what you would like, please enter 0 and the same number of loops will repeat.\n");
    printf ("If you would like to finish, please enter any other number.\n");
    scanf ("%d",&conti);				//scan input
    if (conti == 0){					//add to multiplier for counter in display
      multi++;
    }
  }
printf ("\nThe data points have been saved to ... \n",);
}
