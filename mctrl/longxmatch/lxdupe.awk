BEGIN {OFS=",";FS=","}
$1 ~ /name/{print "name,ra,dec,name2"}
$1 !~ /name/{
    if ($5 != B){
#	if (D - $3 > 0.00277 || D - $3 < -0.00277){
            C = C + 1
	    print C,$0
#	}
    }
    A = $1
    B = $5
    D = $3
}