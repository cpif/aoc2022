func check(x,cycle) {
    return (x-1==cycle||
            x  ==cycle||
            x+1==cycle)?"#":"."
}

BEGIN{x=1;cycle=0;r=""}
$1~/noop/{r=r check(x,cycle);cycle++;cycle=cycle==40?0:cycle}
$1~/addx/{
    r=r check(x,cycle)
    cycle++
    cycle=cycle==40?0:cycle
    r=r check(x, cycle)
    cycle++
    cycle=cycle==40?0:cycle
    x+=$2
}

END {
    print substr(r,1,40)
    print substr(r,41,40)
    print substr(r,81,40)
    print substr(r,121,40)
    print substr(r,161,40)
    print substr(r,201,40)
}
