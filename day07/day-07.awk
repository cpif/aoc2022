FNR==1{t++;d++;next}
$1~/[0-9]/ {
    q=d;f=split(d,a,/-/)
    for (i=1;i<=f;i++) {
        b[q]+=$1
        q=gensub(/-[0-9]*$/,"",1,q)
    }
    next
}
$3~/\.\./{d=gensub(/-[0-9]*$/,"",1,d);next}
/\$ cd/{t++;d=d"-"t;next}
END {
    for (s in b) if (b[s]<100000) y+=b[s]
    m=70000000
    n=b[1]-40000000
    asort(b)
    for (i=length(b);i>=1;i--) {
        if (b[i]>=n&&b[i]<m) m=b[i]
    }
    print y;print m
}
