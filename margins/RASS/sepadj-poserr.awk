BEGIN { t = 0; c = 0 }
{
    t = t + $2
    c = c + 1
    runave = t / c
    runrun = runrun + runave
    aveave = runrun/c
    sepadj = $1 - $2
    if (sepadj < 0) {
	sepadj = $2 - $1
    }
    print $1,sepadj
}