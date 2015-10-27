# This code uses flux ($5) in ergs/cm/cm/s and d_L ($6) in Mpc to output absolute log(luminosity in ergs/s)
{
    lum = 4*3.14159265359*($6^2)*(10^$5)*(3.08567758*10^24)^2
    lug = log(lum)/log(10)
    if ($1 == "name") { lug = "lum" }
    print lug
}