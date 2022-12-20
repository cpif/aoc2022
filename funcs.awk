function rankelves(newelf) {
    if ( newelf >= elves["biggest"] ) {
        elves["big"]     = elves["bigger"]
        elves["bigger"]  = elves["biggest"]
        elves["biggest"] = newelf
    }
    else if ( newelf >= elves["bigger"] ) {
        elves["big"]     = elves["bigger"]
        elves["bigger"]  = newelf
    }
    else elves["big"]    = newelf
}
function abs(x) {
    if ( x < 0 ) x *= -1
    return x
}
function get_sign(x) {
    if ( x < 0 ) return -1
    else if ( x == 0 ) return 0
    else return 1
}
