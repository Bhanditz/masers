BEGIN {OFS=" "}
$1 !~ /#/{print "2000\n"$1"\n"$2}