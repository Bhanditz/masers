BEGIN{c = 299792}
{
    for (i=1; i<NF+1; i++){
	z = z$i/c" "
    }
    print z
}