function abs(x) { return x >= 0 ? x : -x }
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
func alphconv(x, alpha) {
    alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    return index(alpha, x)
}
function lte(x, y) {
    if ( x <= y ) return 1
    else return 0
}
function lt(x, y) {
    if ( x < y ) return 1
    else return 0
}
function gte(x, y) {
    if ( x >= y ) return 1
    else return 0
}
function gt(x, y) {
    if ( x > y ) return 1
    else return 0
}
function is_int(x) {
    return typeof(x)~/strnum/ || typeof(x)~/number/ ? 1 : 0
}
