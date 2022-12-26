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
NF{newelf=newelf+$1;next}
{if (elves["big"]<newelf) rankelves(newelf);newelf=0}
END{print elves["big"]+elves["bigger"]+elves["biggest"]}
