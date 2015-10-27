BEGIN{j=0}{
    for (i=1; i<=NF+1; i++){
	a[i,j] = $i
    }
    j++
    k = NF
}
END{
    for (x=1; x<=k; x++){
	for (y=0; y<j; y++){
	    s[x] = s[x]a[x,y]" "
	}
    print s[x]
    }
}