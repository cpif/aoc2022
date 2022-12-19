BEGIN { begintime = systime() }
FNR==1 {
    split($0,a_max,"")
    count+=length($0)
    for (i in a_max) b_array[i][1]=a_max[i]
    next
}

{
    split($0, current, "")
    count+=2
    max = current[1]
    left_limit = 1
    for ( i = 2; i < length(current); i++ ) {
        if ( current[i] > max ) {
            count++
            max = current[i]
            left_limit = i
            needs_count[i][FNR] = 0
        }
        else if ( current[i] > a_max[i] ) {
            count++
            needs_count[i][FNR] = 0
        }
        else needs_count[i][FNR] = 1
        if ( current[i] > a_max[i] ) a_max[i] = current[i]
        for ( j in b_array[i] ) {
            if ( current[i] >= b_array[i][j] ) delete b_array[i][j]
        }
        b_array[i][FNR] = current[i]
    }
    max = current[length(current)]
    for ( i = length(current) - 1; i > left_limit; i-- ) {
        if ( current[i] > max ) {
            max = current[i]
            if ( needs_count[i][FNR] ) {
                count++
                needs_count[i][FNR] = 0
            }
        }
    }
    lastline = FNR
}

END {
    for ( i in needs_count ) {
        for ( j in needs_count[i] ) {
            if ( needs_count[i][j] && b_array[i][j] ) count++
        }
        if ( needs_count[i][lastline] && b_array[i][lastline] == 0 ) count++
    }
    print count
    print systime() - begintime " seconds execution"
}
