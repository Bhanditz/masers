$1 ~ "num" {print $0}
$1 !~ "num" {
    flux = log($6*(1.4e-11))/log(10)
    print $1,$2,$3,$4,$5,flux,$7
}