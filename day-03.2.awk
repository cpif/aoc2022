BEGIN{alpha="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"}
FNR%3==1{split($1,first,"");next}
FNR%3==2{split($1,second,"");next}
{
    for (letter in first) {
        if (match($1,first[letter])) matches=matches first[letter]
    }
    for (letter in second) {
        if (match(matches,second[letter])) {
            matches=second[letter]
            break
        }
    }
    sum=sum+index(alpha,matches)
    matches=""
}
END{print sum}
