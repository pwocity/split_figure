#!/usr/bin/gawk -f
# asymptote ブロック部分を置換して
# image context:image file name.png[]] に置き換えてみる。
#
# version: 2014-01-26:0.01
# ------------------------
function basename(file,a,n) {
    n = split(file,a,".")
	    return a[1]
}

BEGIN {
	FS = "\""
	fbname=basename(ARGV[1])
	block=0
	newname= fbname "_n.adoc" 
}

/^\[asymptote/{
	flag=1;
	block=block+1
	fname=fbname "_a_" block ".asy"
	next;
}
/^\-+$/ {
	flag=0
	print "image:" fbname "_a_" block ".png[]" > newname
	next;
}
{
	if(flag==1)
		print $0 > fname;
	else
		print $0 > newname;
}
