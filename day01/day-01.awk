func r(){
    if(b>m){b=m;m=t}
    if(m>p){m=p;p=t}
}
NF{c+=$1;next}
{if(b<c){t=b=c;r()}c=0}
END{print p;print b+m+p}
