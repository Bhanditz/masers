BEGIN {FS=","}
$6 > -3 {print $5}