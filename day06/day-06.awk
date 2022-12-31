function uniq(s,l) {
    for (j=1;j<=l;j++) m[j]=gsub(substr(s,1,1),"",s)
    for (k in m) if (m[k]!=1) return 0
    return 1
}

function test(s,l) {
    for (i=1;i<=length(s);i++) {
        if (uniq(substr(s,i,l),l)){print i+l-1;break}
    }
}

{test($0,4);test($0,14)}
