$1 ~ "#"{
    print "name ra dec z flux separation BAT_NAME luminosity"
}
$1 !~ "#"{
    flux = log($3)/log(10) - 12
    print $6,$7,$8,$4,flux,$9,$2,$5
}