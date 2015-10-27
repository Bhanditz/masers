# This code will average the variabilities and variability rates for each range.
# Three lines are output: Line 1 is column titles, line two is uncorrected average, line three is absolute value averages.

BEGIN {print "ave_type lumvar_(0.5-2) lumvarate_(0.5-2) lumvar_(2-10) lumvarate_(2-10) lumvar_(0.5-10) lumvarate_(0.5-10)"}
{
    if ($6 > 0){
	var52 = var52 + $6
	varate52 = varate52 + $7
    }
    else {
	var52 = var52 - $6
	varate52 = varate52 - $7
    }
    if ($8 > 0){
	var210 = var210 + $8
	varate210 = var210 + $9
    }
    else {
	var210 = var210 - $8
	varate210 = var210 - $9
    }
    if ($10 > 0){
	var510 = var510 + $10
	varate510 = varate510 + $11
    }
    else {
	var510 = var510 - $10
	varate510 = var510 - $11
    }
    var521 = var521 + $6
    varate521 = varate521 + $7
    var2101 = var2101 + $8
    varate2101 = var2101 + $9
    var5101 = var5101 + $10
    varate5101 = varate5101 + $11
    c = c + 1
}
END {
    var52 = var52/c
    varate52 = varate52/c
    var210 = var210/c
    varate210 = varate210/c
    var510 = var510/c
    varate510 = varate510/c

    var521 = var521/c
    varate521 = varate521/c
    var2101 = var2101/c
    varate2101 = varate2101/c
    var5101 = var5101/c
    varate5101 = varate5101/c
    
    print "simple_average",var521,varate521,var2101,varate2101,var5101,varate5101
    print "ave_of_magnitudes",var52,varate52,var210,varate210,var510,varate510
}