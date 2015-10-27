$1 ~ "#"{
    print "name ra dec z flux separation 2XMMi hr1 hr2 hr3 hr4 "
}
$1 !~ "#"{
    z = $26/299792
    flux = log($9)/log(10)
    print $23,$24,$25,z,flux,$27,$5,$11,$12,$13,$14
}