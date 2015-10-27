BEGIN { print "flux" }
$3 ~ "predicts"{ print log($10)/log(10) }