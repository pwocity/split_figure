#!/usr/bin/awk -f
function basename(file,a,n) {
    n = split(file,a,".")
	    return a[1]
}

BEGIN {
 FS = "."
 fname;
 fname=basename(ARGV[1])
 print ARGV[1];
 print fn "\n"
 print fname "\n"
}
