BEGIN {
    c=0
    print "log [change this in xco file]\nfrom flux ergs 0.1-10\ninst flux ergs 0.5-2"
}
$1 !~ "z"{
    flux = $1
    nh = 0
    c++
    print "mo po 1.7 "nh"\ngo "flux
}
END {print "exit"}