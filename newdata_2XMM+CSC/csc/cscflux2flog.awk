$1 ~ "name" {print $0}
$1 !~ "name" {
    flog = log($5)/log(10)
    flog2 = log($6)/log(10)
    flog3 = log($7)/log(10)
    print $1,$2,$3,$4,flog,flog2,flog3,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21
}