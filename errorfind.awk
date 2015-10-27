BEGIN {FS=","}
{
    if ($2 > 360){
	print A,$1,$2
    }
A=A+1
}