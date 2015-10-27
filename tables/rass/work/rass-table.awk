$1 ~ "#"{
    print "name ra dec z flux separation 1RXS nh count hr1 hr2"
}
$1 !~ "#"{
    flux = log($7)/log(10)
    sep = $11*3600
    print $1,$3,$4,$5,flux,sep,$2,$10,$6,$8,$9
}