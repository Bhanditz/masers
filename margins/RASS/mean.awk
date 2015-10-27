BEGIN { t = 0; c = 0 }
{
    t = t + $2
    c = c + 1
}
END { print t/c }