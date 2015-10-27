#include <stdio.h>
#include <time.h>
#include <math.h>
#include <iostream>
#include "boost/random.hpp"
#include "boost/generator_iterator.hpp"
long double x[1000000];				        //x array
long double h;						//height of gaussian at random x value
long double k;						//counter keeping track of array slots
int i;							//counter for each iteration
int j;							//counter for number of cycles chosen
long double inp;					//number of cycles
long double big;
int conti;
int multi;
using namespace std;					//declare standard namespace
int main() {
  printf ("\n=====================================================================================\n");
  printf ("----------------- Monte Carlo Data Generator for Maser Group Fluxes -----------------\n");
  printf ("Please indicate the number of calculation cycles (10^6 calculations each) you desire.\n");
  printf ("Choose a value and press enter:\n");
  scanf ("%Lf",&inp);					//accept numerical input
  typedef boost::mt19937 RNGType;			//boost will use mersenne twister generator
  RNGType rng(time(0));   				//seed using time
  boost::normal_distribution<long double> nd(0.0,1.0);	//gaussian distribution 
  boost::variate_generator< RNGType,                    //using seed, define function gauss
			    boost::normal_distribution<long double> > gauss(rng, nd);
  while (conti == 0){
    for (j=1;j<inp+1;j++){				//main loop to repeat cycles according to input
      for (i=0;i<1000000;i++){				//10^6 calculations per cycle
        x[k] = gauss()
	k++
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
printf ("\nThe data points have been saved to ... \n",pi);
}
