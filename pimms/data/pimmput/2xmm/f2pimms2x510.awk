BEGIN {
    c=0
    print "log 2x7\nfrom flux ergs 0.2-12\ninst flux ergs 0.5-10"
}
$1 !~ "z"{
    flux = $1
    nh = $2
    c++
    print "mo po 1.7 "nh"\ngo "flux
}
END {print "exit"}
