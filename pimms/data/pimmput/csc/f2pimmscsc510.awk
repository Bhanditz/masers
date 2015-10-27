BEGIN {
    c=0
    print "log csc\nfrom flux ergs 0.5-7\ninst flux ergs 0.5-10"
}
$1 !~ "z"{
    flux = 10^$1
    nh = 0
    c++
    print "mo po 1.7 "nh"\ngo "flux
}
END {print "exit"}
