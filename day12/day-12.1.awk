@include "funcs"
func neighbors(u) {
    split("", nigh)
    split(u,arr,",")
    l=arr[3]-1
    r=arr[3]+1
    a=arr[2]-1
    b=arr[2]+1
    lval=vertices[arr[2]][l]
    rval=vertices[arr[2]][r]
    aval=vertices[a][arr[3]]
    bval=vertices[b][arr[3]]
    left =lval","arr[2]","l
    right=rval","arr[2]","r
    above=aval","a","arr[3]
    below=bval","b","arr[3]
    if (gt(l,0)&&lte(lval,arr[1]+1))
        nigh[length(nigh)+1]=left
    if (lte(r,cols)&&lte(rval,arr[1]+1))
        nigh[length(nigh)+1]=right
    if (gt(a,0)&&lte(aval,arr[1]+1))
        nigh[length(nigh)+1]=above
    if (lte(b,rows)&&lte(bval,arr[1]+1))
        nigh[length(nigh)+1]=below
}
BEGIN{FS="";starttime=systime()}
NR==1{cols=length($0)}
{
    for (i=1;i<=NF;i++) {
        if ($i~/S/) vertices[NR][i]=0
        else if ($i~/E/) vertices[NR][i]=27
        else vertices[NR][i]=alphconv($i)
        a=vertices[NR][i]","NR","i
        Q[a]=a
        dist[a]=9999999
        if (vertices[NR][i]==0) dist[a]=0
    }
}
END {
    rows=NR
    while (length(Q)>0) {
        tmp = 9999999
        for ( i in Q ) if ( dist[i] < tmp ) {
            tmp = dist[i]
            u = i
        }
        delete Q[u]
        split(u,t,",")
        if (t[1]==27) break
        neighbors(u)
        for (i in nigh) {
            alt=dist[u]+1
            if (alt<dist[nigh[i]]) {
                dist[nigh[i]]=alt
                prev[nigh[i]]=u
            }
        }
    }
    print dist[u]
    print systime()-starttime" seconds execution"
}
