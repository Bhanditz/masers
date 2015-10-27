BEGIN{j=0}{
    for (i=1; i<=NF+1; i++){
	a[i,j] = $i
    }
    j++
}
END{
    for (x=1; x<22; x++){
	if (a[x,0] == "name"){
	    for (y=0; y<14; y++){
		s[x] = s[x]a[x,y]" "
	    }
	    print s[x]
	}
    }
    for (x=1; x<22; x++){
	if (a[x,0] == "1RXS"){
	    for (y=0; y<14; y++){
		s[x] = s[x]a[x,y]" "
	    }
	    print s[x]
	}
    }
    for (x=1; x<22; x++){
	if (a[x,0] == "ra"){
	    for (y=0; y<14; y++){
		s[x] = s[x]a[x,y]" "
	    }
	    print s[x]
	}
    }
    for (x=1; x<22; x++){
	if (a[x,0] == "dec"){
	    for (y=0; y<14; y++){
		s[x] = s[x]a[x,y]" "
	    }
	    print s[x]
	}
    }
    for (x=1; x<22; x++){
	if (a[x,0] == "vsys"){
	    for (y=0; y<14; y++){
		s[x] = s[x]a[x,y]" "
	    }
	    print s[x]
	}
    }
    for (x=1; x<22; x++){
	if (a[x,0] == "Count"){
	    for (y=0; y<14; y++){
		s[x] = s[x]a[x,y]" "
	    }
	    print s[x]
	}
    }
    for (x=1; x<22; x++){
	if (a[x,0] == "HR1"){
	    for (y=0; y<14; y++){
		s[x] = s[x]a[x,y]" "
	    }
	    print s[x]
	}
    }
    for (x=1; x<22; x++){
	if (a[x,0] == "HR2"){
	    for (y=0; y<14; y++){
		s[x] = s[x]a[x,y]" "
	    }
	    print s[x]
	}
    }
}