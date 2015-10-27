# Default is six fields. Each catalog adds:
# 2xmmi     ,$7,$8,$9,$10,$11
# CSC       ,$7
# Integral  none
# Rass      ,$7,$8,$9,$10,$11
# Swift     
BEGIN {OFS=","}
{print $1,$2,$3,$4,$5,$6,$7,$8}