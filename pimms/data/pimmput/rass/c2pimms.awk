BEGIN {
    c=0
    print "log rename\nfrom rosat pspc open\ninst flux ergs 0.1-2"
}
$1 !~ "z"{
    count = $2
    nh = $3
    c++
    print "mo po 2.3 "nh"\ngo "count
}
END {print "exit"}