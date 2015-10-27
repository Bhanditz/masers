$1 ~ "name"{
    print "name ra dec z flux separation"
}
$1 !~ "name"{
    z = $4/299792
    flux = log($5)/log(10) - 11
    sep = $6*3600
    print $1,$2,$3,z,flux,sep
}