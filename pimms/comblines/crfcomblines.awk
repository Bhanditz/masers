BEGIN{j=0}{
    for (i=1; i<=NF+1; i++){
	a[i,j] = $i
    }
    j++
}
END{
    for (x=1; x<22; x++){
	if (a[x,0] == "name"){
	    for (y=0; y<75; y++){
		s[x] = s[x]a[x,y]" "
	    }
	    print s[x]
	}
    }
    for (x=1; x<22; x++){
	if (a[x,0] == "name_cone"){
	    for (y=0; y<75; y++){
		s[x] = s[x]a[x+1,y]" "
	    }
	    print s[x]
	}
    }
    for (x=1; x<22; x++){
	if (a[x,0] == "ra"){
	    for (y=0; y<75; y++){
		s[x] = s[x]a[x,y]" "
	    }
	    print s[x]
	}
    }
    for (x=1; x<22; x++){
	if (a[x,0] == "dec"){
	    for (y=0; y<75; y++){
		s[x] = s[x]a[x,y]" "
	    }
	    print s[x]
	}
    }
    for (x=1; x<22; x++){
	if (a[x,0] == "velo"){
	    for (y=0; y<75; y++){
		s[x] = s[x]a[x,y]" "
	    }
	    print s[x]
	}
    }
    for (x=1; x<22; x++){
	if (a[x,0] == "count_rate"){
	    for (y=0; y<75; y++){
		s[x] = s[x]a[x+1,y]" "
	    }
	    print s[x]
	}
    }
    for (x=1; x<22; x++){
	if (a[x,0] == "hardness_ratio_1"){
	    for (y=0; y<75; y++){
		s[x] = s[x]a[x+1,y]" "
	    }
	    print s[x]
	}
    }
    for (x=1; x<22; x++){
	if (a[x,0] == "hardness_ratio_2"){
	    for (y=0; y<75; y++){
		s[x] = s[x]a[x+1,y]" "
	    }
	    print s[x]
	}
    }
}