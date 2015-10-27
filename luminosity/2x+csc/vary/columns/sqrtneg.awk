{
    if ($1 < 0){
	x = -sqrt(-$1)
    }
    else {
	x = sqrt($1)
    }
    print x
}