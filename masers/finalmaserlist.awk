BEGIN {OFS=","}
$1 ~ /Count/{print "num,name,ra,dec,vsys"}
$1 !~ /Count/{
    if (($11 && ($11 !~ /multiple/)) || $2 == "NGC" || $2 == "UGC") { #space
	RAS = ($4 + ($5 / 60) + ($6 / 3600))*15
        if ($7 > 0 || $7 == "+00"){
            DECS = $7 + ($8 / 60) + ($9 / 3600)
	}
	if ($7 < 0 || $7 == "-00"){
            DECS = $7 - ($8 / 60) - ($9 / 3600)
	}
	if ($0 ~ /SF/) {
	    print  $1,$2 $3,RAS,DECS ",novalue"
	}
	else {
	    print  $1,$2 $3,RAS,DECS,$10
	}
    }
    else { #no space
	RAN = ($3 + ($4 / 60) + ($5 / 3600))*15
	if ($6 > 0 || $6 == "+00"){
	    DECN = $6 + ($7 / 60) + ($8 / 3600)
	}
	if ($6 < 0 || $6 == "-00"){
	    DECN = $6 - ($7 / 60) - ($8 / 3600)
	}
	print $1,$2,RAN,DECN,$9
    }
}