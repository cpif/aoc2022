function countleft ( i, linenr,     j, max, count) {
    max = -1
    for ( j = i - 1; j >= 1; j-- ) {
        if ( current[j] >= current[i] ) {
            count++
            break
        }
        else count++
#       else if ( current[j] >= max ) {
#           max = current[j]
#           count++
#       }
    }
    return count
}

function countright ( i, linenr,    j, max, count) {
    max = -1
    for ( j = i + 1; j <= length(current); j++ ) {
        if ( current[j] >= current[i] ) {
            count++
            break
        }
        else count++
    }
    return count
}

function countup ( i, linenr,   j, max, count) {
    max = -1
    for ( j = linenr - 1; j >= 1; j-- ) {
        if ( a_array[j][i] >= current[i] ) {
            count++
            break
        }
        else count++
    }
    return count
}

function countdown ( i, linenr, lastline,     j, max, count) {
    max = -1
    for ( j = linenr + 1; j <= lastline; j++ ) {
        if ( a_array[j][i] >= a_array[linenr][i] ) {
            count++
            break
        }
        else count++
    }
    return count
}

BEGIN { begintime = systime() }

FNR==1 {
    split($0, a_array[1], "")
    next
}

{
    split($0, current, "")
    split($0, a_array[FNR], "")
    for ( i = 2; i < length(current); i++ ) {
        count[FNR][i] = countleft(i, FNR)
        count[FNR][i] *= countright(i, FNR)
        count[FNR][i] *= countup(i, FNR)
    }
    lastline = FNR
}

END {
    max = -1
    for ( i = 2; i < lastline; i++ ) {
        for ( j = 2; j < length(a_array[i]); j++ ) {
            count[i][j] *= countdown( j, i, lastline )
            if ( count[i][j] > max ) max = count[i][j]
        }
    }
    print max
    print systime() - begintime " seconds execution"
}
