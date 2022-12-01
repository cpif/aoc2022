BEGIN {
    elfsum = 0
    bigelf = 0
}

NF {
    elfsum = elfsum + $1
}

NF == 0 {
    if ( bigelf < elfsum ) {
        bigelf = elfsum
    }
    elfsum = 0
}

END {
    print bigelf
}
