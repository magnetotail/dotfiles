#!/bin/bash
sizeFile="/tmp/term_font_size"
if [ $1 = "+" ]; then
	direction="bigger"
elif [ $1 = "-" ]; then
	direction="smaller"
elif [ $1 = "0" ]; then
	direction="none"
	rm $sizeFile
else 
	echo "$1 is not a valid argument."
	exit
fi
echo $direction
if [ -f "$sizeFile" ]; then
	fontSize=$(cat $sizeFile)
else
	fontSize=$(cat "/home/selphie/.Xdefaults" | grep -o -e "size=[[:digit:]]*" | sed "s/size=//g")
	touch $sizeFile
fi
if [ $direction = "bigger" ]; then
	fontSize=$(($fontSize + 1))
elif [ $direction = "smaller" ]; then
	fontSize=$(($fontSize - 1))
fi
echo $fontSize
for term in /dev/pts/[0-9]*
do
	echo -e "\033]710;xft:FiraMono:size=$fontSize\007" > $term
done
echo $fontSize > $sizeFile
exit
