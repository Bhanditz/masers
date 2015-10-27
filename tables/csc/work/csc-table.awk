change this

$1 ~ "#"{
    print "name ra dec z flux Separation flux_w"
}
$1 !~ "#"{
    b = log($7)/log(10)
    w = log($8)/log(10)
    if ($7>0 && $8>0){
	z = $4/299792
	print $1,$2,$3,z,b,$9,w
    }
    else if ($7 > 0) {
	z = $4/299792
	print $1,$2,$3,z,b,$9,"0"
    }
    else {
	z = $4/299792
	print $1,$2,$3,z,w,$9,"1"
    }
}