BEGIN {
    a["B"]["X"] = 1
    a["C"]["Y"] = 2
    a["A"]["Z"] = 3
    a["A"]["X"] = 4
    a["B"]["Y"] = 5
    a["C"]["Z"] = 6
    a["C"]["X"] = 7
    a["A"]["Y"] = 8
    a["B"]["Z"] = 9
}

{
    sum = sum + a[$1][$2]
}

END {
    print sum
}
