func p(x,o,m) {
    if (o~/\*/&&o~/[0-9]/) {gsub(/[^0-9]/,"",o);x*=o}
    else if (o~/\*/) x*=x
    else if (o~/\+/&&o~/[0-9]/) {gsub(/[^0-9]/,"",o);x+=o}
    else if (o~/\+/) x+=x
    q[m]++
    return x
}
func b(x,t) {if (int(x)%int(t)==0) return 1;else return 0 }
func c(x,e,g,k,t,f) {
    x%=n
    if (b(x,e)) d[t][length(d[t])+1]=x
    else d[f][length(d[f])+1]=x
    delete d[g][k]
}
BEGIN{FS=": ";n=1}
FNR%7==1{gsub(/[^0-9]/,"");a=$0}
FNR%7==2{split($2,d[a],/, /)}
FNR%7==3{gsub(/^[^=]*= /,"",$2);op[a]=$2}
FNR%7==4{gsub(/[^0-9]/,"",$2);ts[a]=$2;n*=$2}
FNR%7==5{gsub(/[^0-9]/,"",$2);tr[a]=$2}
FNR%7==6{gsub(/[^0-9]/,"",$2);fa[a]=$2}
END {
    for (h=1;h<=10000;h++) {
        for (i=0;i<=a;i++) {
            for (j in d[i]) c(p(d[i][j],op[i],i),ts[i],i,j,tr[i],fa[i])
        }
    }
    asort(q)
    print q[length(q)]*q[length(q)-1]
}
