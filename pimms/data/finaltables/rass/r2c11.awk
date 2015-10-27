BEGIN {j=0}
{
    for (i=0; i<=NF; i++){
	a[i,j] = $i
    }
    j++
    n=NF
}
END {
    for (i=0; i<=n; i++){
	for (j=0; j<11; j++){
	    newrow = newrow a[i,j]" "
	}
	print newrow
	newrow = ""
    }
}