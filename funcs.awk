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
