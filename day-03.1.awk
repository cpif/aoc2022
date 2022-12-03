@include "alnum"

function finddupe(line, first, second, arr) {
    first  = substr($1, 0, length($1) * 0.5)
    second = substr($1, length($1) * 0.5 + 1)
    split(first, arr, "")
    for ( letter in arr ) {
        if ( match(second, arr[letter]) ) return arr[letter]
    }
}

{
    sum = sum + index(alpha, finddupe($1))
}

END {
    print sum
}
