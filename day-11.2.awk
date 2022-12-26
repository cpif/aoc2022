func operate(x,o,m) {
    if (o~/\*/&&o~/[0-9]/) {
        gsub(/[^0-9]/,"",o)
        x*=o
    }
    else if (o~/\*/) x*=x
    else if (o~/\+/&&o~/[0-9]/) {
        gsub(/[^0-9]/,"",o)
        x+=o
    }
    else if (o~/\+/) x+=x
    inspect[m]++
    return x
}
func test(x,t) {
    if (int(x)%int(t)==0) return 1
    else return 0
}
func throw(x,cond,monkey,item,t,f) {
    x%=n
    if (test(x,cond)) items[t][length(items[t])+1]=x
    else items[f][length(items[f])+1]=x
    delete items[monkey][item]
}
BEGIN{FS=": ";n=1}
FNR%7==1{gsub(/[^0-9]/,"");a=$0}
FNR%7==2{split($2,items[a],/, /)}
FNR%7==3{gsub(/^[^=]*= /,"",$2);op[a]=$2}
FNR%7==4{gsub(/[^0-9]/,"",$2);tst[a]=$2;n*=$2}
FNR%7==5{gsub(/[^0-9]/,"",$2);true[a]=$2}
FNR%7==6{gsub(/[^0-9]/,"",$2);false[a]=$2}
END {
    for (h=1;h<=10000;h++) {
        for (i=0;i<=a;i++) {
            for (j in items[i]) throw(operate(items[i][j],op[i],i),tst[i],i,j,true[i],false[i])
        }
    }
    asort(inspect)
    print inspect[length(inspect)]*inspect[length(inspect)-1]
}
