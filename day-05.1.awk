function execute(q,r,s) {
    for (i=1;i<=q;i++) {
        aggarr(crate[r][i],s)
        crate[r][i]=""
    }
    cut(r)
}

function aggarr(val,pos) {
    for (j=length(crate[pos]);j>=1;j--) crate[pos][j+1]=crate[pos][j]
    crate[pos][j+1]=val
}

function mcrate(tmp) {
    c++
    for (item in tmp) crate[item][c]=tmp[item]
}

function cut(col) {
    split("", newcrate)
    z = 1
    for (row in crate[col]) {
        if (crate[col][row]~/[A-Z]/) {
            newcrate[z]=crate[col][row]
            z++
        }
    }
    split("", crate[col])
    for (row in newcrate) crate[col][row]=newcrate[row]
}

is {execute($2,$4,$6);next}
NF==0 {is++;for (col in crate) cut(col);next}
{patsplit($0,tmp,/.{3} ?/);mcrate(tmp)}

END {
    for (col in crate) printf "%s ",crate[col][1]
    printf "\n"
}
