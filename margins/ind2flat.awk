BEGIN {j=0}
{
    if (j == 0) {
	bin = $1
    }
    j++
    x = $1 - bin
    print x,$2"\n"$1,$2
}