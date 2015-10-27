BEGIN {OFS=","}
{
    if ($6 == "\"\""){
	print $1,$2,$3,$4,$5,"void",$7,"void",$9,"void",$11,"void",$13,"void"
    }
    else if ($5 == "\"\""){
	print $1,$2,$3,$4,"void",$6,"void",$8,"void",$10,"void",$12,"void",$14
    }
    else {
	print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14
    }
}