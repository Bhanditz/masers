$1 ~ "#" {print "# name ra dec z flux_(0.5-2) flux_(2-10) flux_(0.5-10) csc_name 2xmm_iauname"}
$1 !~ "#" {
    if ($5 == "\"\"") {
	flux52 = $6
	flux210 = $8
	flux510 = $10
    }
    else if ($6 == "\"\"") {
	flux52 = $5
	flux210 = $7
	flux510 = $9
    }
    else {
	flux52 = log((10^$5 + 10^$6)/2)/log(10)
	flux210 = log((10^$7 + 10^$8)/2)/log(10)
	flux510 = log((10^$9 + 10^$10)/2)/log(10)
    }
    print $1,$2,$3,$4,flux52,flux210,flux510,$11,$12
}