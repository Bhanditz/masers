BEGIN { t = 0; c = 0 }
{
    t = t + $2
    c = c + 1
    runave = t / c
    runrun = runrun + runave
    aveave = runrun/c
    if ($1 > $2) {
	sepadj = $1 - $2
    }
    else if ($1 > ($2 - runave)) {
	sepadj = $1 - ($2 - runave)
    }
    else if ($1 > (runave - $2)) {
	sepadj = $1 - (runave - $2)
    }
    print $1,sepadj
}