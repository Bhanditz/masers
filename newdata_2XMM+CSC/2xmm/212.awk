$1 ~ "name" {print "flux_(2-12)"}
$1 !~ "name" {
    f45 = $11 + $12
    print f45
}