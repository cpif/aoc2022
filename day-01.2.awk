@include "funcs"

NF {
    newelf = newelf + $1
    next
}

{
    if ( elves["big"] < newelf ) rankelves(newelf)
    newelf = 0
}

END {
    print elves["big"] + elves["bigger"] + elves["biggest"] 
}
