$1 ~ "name" {print "# name ra dec z 2xmm_flux_(0.5-2) 2xmm_flux_(2-10) 2xmm_flux_(0.5-10) 2xmm_iauname 2xmm_mjd"}
    $1 !~ "name" {
    nf = log(10^$5 + 10^$6)/log(10)
    print $1,$2,$3,$4,$5,$6,nf,$7,$8
}