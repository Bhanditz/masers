BEGIN{c = 0}
{
    a[c] = $0
    c = c + 1
    if (c == 3){
	for (i=0; i<c; i++){
	     b = b a[i]" "
	}
	print b
	b = ""
	c = 0
    }
}