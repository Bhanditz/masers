BEGIN { print "flux" }
$3 ~ "predicts"{ print $10 }