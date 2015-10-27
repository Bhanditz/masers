BEGIN {OFS=" "}
$1 !~ /#/{print "2000\n"$2"\n"$3}