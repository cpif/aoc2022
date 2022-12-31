END{print e,f}
{e+=c[$1][$2];f+=d[$1][$2]}
BEGIN{
    a="BCAABCCAB";b="XYZ"
    for(i=0;i<9;i++){
        c[substr(a,i+1,1)][substr(b,i%3+1,1)]=i+1
        d[substr(a,i+1,1)][substr(b,int(i/3+1),1)]=i+1
    }
}
