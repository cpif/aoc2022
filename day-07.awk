FNR==1{t++;d++;next}
$1~/[0-9]/ {
    tmp=d
    f=split(d,a,/-/)
    for (i=1;i<=f;i++) {
        size[tmp]+=$1
        tmp=gensub(/-[0-9]*$/,"",1,tmp)
    }
    next
}
$3~/\.\./ {d=gensub(/-[0-9]*$/,"",1,d);next}
$0~/\$ cd/ {t++;d=d"-"t;next}
END {
    for (s in size) if (size[s]<100000) sum+=size[s]
    max=70000000
    need=size[1]-40000000
    asort(size)
    for (i=length(size);i>=1;i--) {
        if (size[i]>=need&&size[i]<max) max=size[i]
    }
    print "Part 1: " sum
    print "Part 2: " max
}
