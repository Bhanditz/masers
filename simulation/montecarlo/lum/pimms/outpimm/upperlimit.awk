{
	if ($1 > 46) {
		a = sqrt($1 - 46)/2 + 43
		print a
	}
	else {print $1}
}