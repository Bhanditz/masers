BEGIN{j=0}{
    for (i=1; i<=NF+1; i++){
	a[i,j] = $i
    }
    j++
}
END{
    for (x=1; x<j; x++){
	if (a[x,0] == "name"){
	    for (y=0; y<10; y++){
		s[x] = s[x]a[x,y]" "
	    }
	    print s[x]
	}
    }
}