func a(x,c) {s+=x*c}
func b(c) {if (!((c%40)-20)) return 1;else return 0}
/noop/{c++;if (b(c)) a(x,c)}
/addx/{c++;if (b(c)) a(x,c);c++;if (b(c)) a(x,c);x+=$2;}
BEGIN{x=1} END {print s}
