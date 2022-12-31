@include "funcs"
func move (p,c) {
    split(p,o,":")
    split(c,n,":")
    horz=o[1]-n[1]
    vert=o[2]-n[2]
    hsig=get_sign(horz)
    vsig=get_sign(vert)
    if (abs(horz)>1){n[1]+=hsig;if (abs(vert)>0)n[2]+=vsig}
    else if (abs(vert)>1){n[2]+=vsig;if (abs(horz)>0)n[1]+=hsig}
    return n[1]":"n[2]
}
BEGIN{for (i=0;i<=9;i++) h[i]="0:0"}
{
    switch ($1) {
        case "L": d="h";s=-1;break
        case "R": d="h";s=1;break
        case "U": d="v";s=-1;break
        case "D": d="v";s=1;break
    }
    for (i=1;i<=$2;i++) {
        if (d=="h") h[0]=(substr(h[0],1,index(h[0],":")-1)+s)substr(h[0],index(h[0],":"))
        else h[0]=substr(h[0],1,index(h[0],":"))(substr(h[0],index(h[0],":")+1)+s)
        for (j=1;j<=9;j++) h[j]=move(h[j-1],h[j])
        q++
        map[q]=h[9]
    }
}
END {
    asort(map)
    for (item in map) if (map[item-1]!=map[item]) count++
    print count
}
