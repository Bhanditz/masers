BEGIN {OFS=","}
$1 ~ /Source/{print "name,ra,dec,velo"}
$1 !~ /Source/{
    gsub("C-","C")
    if ($1 != A){
      	RA = ($2 + ($3 / 60) + ($4 / 3600))*15
	if ($5 > 0 || $5 == "+00"){
	    DEC = $5 + ($6 / 60) + ($7 / 3600)
	}
	if ($5 < 0 || $5 == "-00"){
	    DEC = $5 - ($6 / 60) - ($7 / 3600)
	}
	if (D - DEC > 0.00277 || D - DEC < -0.00277){
	    print $1,RA,DEC,$8
	}
    }
    A = $1
    D = DEC
}