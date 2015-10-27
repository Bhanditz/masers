BEGIN {
    c=0
    print "log csc\nfrom flux ergs 2-12\ninst flux ergs 2-10"
}
$1 !~ "z"{
    flux = $2
    nh = $1
    c++
    print "mo po 1.7 "nh"\ngo "flux
}
END {print "exit"}