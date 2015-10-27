BEGIN {OFS=","}
$1 ~ /Source/{print "name,ra,dec,velo,date,tsys,int,rmsl,vlol,vhil,rms2,vhi2"}
$1 !~ /Source/{
    gsub("C-","C")
    RA = ($2 + ($3 / 60) + ($4 / 3600))*15
    if ($5 > 0 || $5 == "+00"){
        DEC = $5 + ($6 / 60) + ($7 / 3600)
    }
    if ($5 < 0 || $5 == "-00"){
	DEC = $5 - ($6 / 60) - ($7 / 3600)
    }
    print $1,RA,DEC,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17
}