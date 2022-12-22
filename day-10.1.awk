func add(x,cycle) {sum+=x*cycle}
func check(cycle) {
    if (cycle==20 ||
        cycle==60 ||
        cycle==100||
        cycle==140||
        cycle==180||
        cycle==220) return 1
    else return 0
}
BEGIN{x=1}
$1~/noop/{cycle++;if (check(cycle)) add(x,cycle)}
$1~/addx/{
    cycle++
    if (check(cycle)) add(x,cycle)
    cycle++
    if (check(cycle)) add(x,cycle)
    x+=$2
}
END {print sum}
