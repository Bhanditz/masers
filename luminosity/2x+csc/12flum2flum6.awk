$1 ~ "name" {print "name ra dec z flux_(0.5-2) flux_(2-10) flux_(0.5-10) d_L lum_(0.5-2) lum_(2-10) lum_(0.5-10) csc_name 2xmm_iauname csc_mjd 2xmm_mjd"}
$1 !~ "name" {
    if ($5 == "\"\"") {
	flux52 = $6
	flux210 = $8
	flux510 = $10
	lum52 = $13
	lum210 = $15
	lum510 = $17
    }
    else if ($6 == "\"\"") {
	flux52 = $5
	flux210 = $7
	flux510 = $9
	lum52 = $12
	lum210 = $14
	lum510 = $16
    }
    else {
	flux52 = log((10^$5 + 10^$6)/2)/log(10)
	flux210 = log((10^$7 + 10^$8)/2)/log(10)
	flux510 = log((10^$9 + 10^$10)/2)/log(10)
	lum52 = log((10^$12 + 10^$13)/2)/log(10)
	lum210 = log((10^$14 + 10^$15)/2)/log(10)
	lum510 = log((10^$16 + 10^$17)/2)/log(10)
    }
    print $1,$2,$3,$4,flux52,flux210,flux510,$11,lum52,lum210,lum510,$18,$19,$20,$21
}