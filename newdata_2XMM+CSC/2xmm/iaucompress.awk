$1 ~ "name" {print $0}
$1 !~ "name" {
    z = $4/299792.458
    print $1,$2,$3,z,$5,$6"-"$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17
}