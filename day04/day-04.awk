{
    patsplit($0,a,"[0-9]+")
    if(a[1]>=a[3]&&a[2]<=a[4])b+=1
    else if(a[3]>=a[1]&&a[4]<=a[2])b+=1
    if(a[2]>=a[3]&&a[2]<=a[4])c+=1
    else if(a[4]>=a[1]&&a[4]<=a[2])c+=1
}
END{print b,c}
