BEGIN { OFS = ","; FS = ","; c = 0}
$1 ~ "name" {
    print "num",$0
}
$1 !~ "name" {
    c = c+1
    print c,$0
}