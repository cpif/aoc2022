function abs(x) { return x>=0?x:-x }
function get_sign(x) {
    if ( x < 0 ) return -1
    else if ( x == 0 ) return 0
    else return 1
}
function lcm(x,y) {
    i = x
    j = y
    while ( x != y ) {
        if ( x < y ) x += i
        else y += j
    }
    return x
}
