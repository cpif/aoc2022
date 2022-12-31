function a(q,r,s,i,t) {
    split("",t)
    for (i=1;i<=q;i++) {
        b(c[r][i],s,c);t[i]=f[r][i]
        f[r][i]="";c[r][i]=""
    }
    e(r,c);e(r,f);g(t,s)
}

function b(x,y,c,i) {
    for(i=length(c[y]);i>=1;i--)c[y][i+1]=c[y][i]
    c[y][j+1]=x
}

function e(x,c,n,i,y) {
    split("",n);y=1
    for(i in c[x]){
        if (c[x][i]~/[A-y]/){n[y]=c[x][i];y++}
    }
    split("",c[x])
    for(i in n)c[x][i]=n[i]
}

function g(a,x,i) {
    for(j=length(f[x]);j>=1;j--)f[x][j+length(a)]=f[x][j]
    for(i in a)f[x][i]=a[i]
}

function m(x,a,i) {d++;for(i in x)a[i][d]=x[i]}

z{a($2,$4,$6);next}
!NF{z++;for(i in c)e(i,c);for(i in f)e(i,f);next}
{patsplit($0,q,/.{3} ?/);m(q,c);m(q,f)}

END {
    for(i in c)printf"%s",c[i][1];printf"\n"
    for(i in f)printf"%s",f[i][1];printf"\n"
}
