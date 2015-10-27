# This code uses flux ($5) in ergs/cm/cm/s and d_L ($6) in Mpc to output absolute log(luminosity in ergs/s)
# 2xmmi    $1,$2,$3,$4,$5,$6,lug,$7,$8,$9,$10,$11,$12
# CSC      $1,$2,$3,$4,$5,$6,lug,$7,$8
# Integral $1,$2,$3,$4,$5,$6,lug,$7
# RASS     $1,$2,$3,$4,$5,$6,lug,$7,$8,$9,$10,$11,$12
# Swift    $1,$2,$3,$4,$5,$6,lug,$7,$8
{
    lum = 4*3.14159265359*($6^2)*(10^$5)*(3.08567758*10^24)^2
    lug = log(lum)/log(10)
    if ($1 == "name") { lug = "lum" }
    print $1,$2,$3,$4,$5,$6,lug,$7,$8,$9,$10,$11,$12
}