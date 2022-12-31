func a(x,c) {return (x-1==c||x==c||x+1==c)?"#":"."}

END{for(i=1;i<205;i+=40)print substr(r,i,40)}
BEGIN{x=1;c=0;r=""}

/noop/{r=r a(x,c);c++;c=c==40?0:c}
/addx/{r=r a(x,c);c++;c=c==40?0:c
       r=r a(x,c);c++;c=c==40?0:c
       x+=$2}
