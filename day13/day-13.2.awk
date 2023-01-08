BEGIN{s="!#$%&'()*+,-.";c[++d]="2";c[++d]="6"}

NF{count++;c[++d] = parse($0)
   getline;c[++d] = parse($0)}

END {
    asort(c)
    for (i in c) {
        if (c[i]=="2") t=i
        else if (c[i]=="6") t*=i
    }
    print t
}

function parse(x,y,n) {
    gsub("10","A",x)
    for (i=1;i<=length(x);i++) {
        switch (substr(x,i,1)) {
            case "[":n++;break
            case ",":y=y substr(s,n,1);break
            case "]":if (last!="]")n--;break
            default: y=y substr(x,i,1) }
        last=substr(x,i,1)
    }
    return y
}
