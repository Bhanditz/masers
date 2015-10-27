BEGIN { t = 0; c = 0 }
{
    c = c + 1
    t = t + $1
}
END { print t/c }