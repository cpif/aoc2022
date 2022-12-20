@include "funcs"
{
    switch ($1) {
        case "L":
            d = "h"
            s = -1
            break
        case "R":
            d = "h"
            s = 1
            break
        case "U":
            d = "v"
            s = -1
            break
        case "D":
            d = "v"
            s = 1
            break
    }
    for (i=1;i<=$2;i++) {
        if (d=="h") H_x+=s
        else H_y+=s
        if (abs(H_x-T_x)>1) {
            T_x+=s
            T_y=H_y
        }
        if (abs(H_y-T_y)>1) {
            T_y+=s
            T_x=H_x
        }
        map[T_x][T_y] = 1
    }
}
END {
    for (i in map) for (j in map[i]) count++
    print count
}
