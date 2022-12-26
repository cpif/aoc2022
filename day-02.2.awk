BEGIN {
    a["B"]["X"] = 1
    a["C"]["X"] = 2
    a["A"]["X"] = 3
    a["A"]["Y"] = 4
    a["B"]["Y"] = 5
    a["C"]["Y"] = 6
    a["C"]["Z"] = 7
    a["A"]["Z"] = 8
    a["B"]["Z"] = 9
}
{sum+=a[$1][$2]}
END{print sum}
