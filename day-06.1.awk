function uniq(s) {
    for (j=1;j<=4;j++) m[j]=gsub(substr(s,1,1),"",s)
    for (k in m) if (m[k]!=1) return 0
    return 1
}

{
    for (i=1;i<=length($1);i++) {
        if (uniq(substr($1,i,4))) {
            print i+3
            break
        }
    }
}
