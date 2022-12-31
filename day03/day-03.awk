func d() {
    split(substr($1,0,length($1)*.5),a,"")
    for(i in a)
        if(match(substr($1,length($1)*.5+1),a[i]))
        return index(z,a[i])
}
BEGIN{z="abcdefghijklmnopqrstuvwxyz";z=z toupper(z)}
END{print c,e}
{c+=d()}
NR%3==1{split($1,f,"");next}
NR%3==2{split($1,s,"");next}
{
    for(l in f)if(match($1,f[l]))m=m f[l]
    for(l in s)if(match(m,s[l])) {m=s[l];break}
    e+=index(z,m);m=""
}
