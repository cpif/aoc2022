BEGIN {s="!#$%&'()*+,-."} END {print t}
function p(x,y,n) {gsub("10","A",x)
    for (i=1;i<=length(x);i++) 
        switch (substr(x,i,1)) {
            case "[":n++;break
            case ",":y=y substr(s,n,1);break
            case "]":y=y substr(s,n,1);n--;break
            default: y=y substr(x,i,1) }
    return y
}
NF{u++;a[1]=p($0);getline;a[2]=p($0)
   asort(a,b);if(a[1]==b[1])t+=u}
