#!/bin/bash
cat <<__EOT__
ad args:
$0
$1
$2
$3
__EOT__
for OPT in $*
do
    case $OPT in
        '-a' )
            FLAG_A=1
            shift
            ;;
        '-v' )
            FLAG_V=1
            ;;
        '-p' )
            FLAG_P=1
            ;;
        '-n' )
            FLAG_N=1
            VALUE_N=$2
            shift 2
            ;;
    esac
done
cat <<__EOT__
ad args:
$0
$1
$2
$3
__EOT__
echo "ad file:" $1
split_adoc_asymptote.awk $1
asy -f png *.asy
if [ "$FLAG_A" ]; then
	echo "remove .asy"
    rm *.asy
fi
asciidoctor -a stem=latexmath *.adoc 
if [ "$FLAG_V" ]; then
   google-chrome *.html &
fi
