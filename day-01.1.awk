NF{elfsum=elfsum+$1;next}
{if(bigelf<elfsum) bigelf=elfsum;elfsum=0}
END{print bigelf}
