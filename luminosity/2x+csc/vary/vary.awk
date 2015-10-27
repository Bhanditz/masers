# This code is used to find the variability in luminosity values in the tables of overlap between two catalogs.
# This is modeled after the file with 12 total flux & luminosity columns: m-2xcsc-overlap.dat
# This code accepts only inputs of the log of each luminosity. As such it finds the actual luminosity, then
# divides the difference in luminosities by the average luminosity. This general variability is found, then
# it is divided by the time to also display a variability with respect to time.

BEGIN {print "name ra dec z d_L lumvar_(0.5-2) lumvarate_(0.5-2) lumvar_(2-10) lumvarate_(2-10) lumvar_(0.5-10) lumvarate_(0.5-10) csc_name 2xmm_iauname mjdvar"}   
$1 !~ "name" {
    if ($21 > $20){
	var52 = ((10^$13 - 10^$12) / ((10^$13 + 10^$12)/2))
	var210 = ((10^$15 - 10^$14) / ((10^$15 + 10^$14)/2))
	var510 = ((10^$17 - 10^$16) / ((10^$17 + 10^$16)/2))
	varmjd = $21 - $20
    }
    else if ($20 > $21){
	var52 = ((10^$12 - 10^$13) / ((10^$12 + 10^$13)/2))
	var210 = ((10^$14 - 10^$15) / ((10^$14 + 10^$15)/2))
	var510 = ((10^$16 - 10^$17) / ((10^$16 + 10^$17)/2))
	varmjd = $20 - $21
    }
    else {print "ERROR: Following row is incorrect: "}
    varate52 = var52/varmjd
    varate210 = var210/varmjd
    varate510 = var510/varmjd
    print $1,$2,$3,$4,$11,var52,varate52,var210,varate210,var510,varate510,$18,$19,varmjd
}