#!/bin/bash

		#VAR
# $1 and $2 - the source directory
# temdir - directory, for copy/debug all correct files
tempdir=/home/sm/workf/awork/newtempdir

		#PROGRAM CODE
	echo
	echo
echo -e "\t\tls - l:  Files from $1"
ls $1 -l # |grep ^- # grep ^- - displays only files
	echo
	echo
echo -e "\t\tls - l:  Files from $2"
ls $2 -l
	echo
	echo

echo -e "\t\tCreate new temp dir for debug"
mkdir $tempdir
find $2/ -maxdepth 1 -type f -exec cp -p '{}' $tempdir \;
ls $tempdir -l
	echo
	echo

echo -e "\t\tСompare files over time and copy newer ones"
ls $1 | while read i
do
	echo  "$i"
	find $2 -type f -name $i ! -newer $i -exec echo -e "\t\t$1 - FILE YOUNGER" \;  -exec cp -r -p $1/$i $tempdir/ \;
echo "---------------"
done

# Copy unique  file from $1 dir
find $1/ -maxdepth 1 -type f -exec cp -p -n '{}' $tempdir \;
	echo
	echo

echo -e "\t\tThe result of the program"
ls $tempdir -l
	echo
	echo

echo -e "\t\t!!!PROGRAM END!!!"

#DELET TEMDIR
#rm -r $tempdir

exit 0
