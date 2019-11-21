#!/bin/bash
tempdir=/home/sm/workf/awork/newtempdir
	echo
	echo
echo -e "\t\tFiles from $1"
ls $1 -l # |grep ^-
	echo
	echo
echo -e "\t\tFiles from $2"
ls $2 -l # |grep ^-
	echo
	echo

echo "==================================="
echo -e "\t\tCreate new temp dir for debug"
mkdir $tempdir
find $2/ -type f -maxdepth 1 -exec cp -p '{}' $tempdir \;
ls $tempdir -l
	echo
	echo

#$1/$i
echo "==================================="
echo -e "\t\tTime comparison"
ls $1 | while read i
do
	echo  "$i"
	find $2 -type f -name $i ! -newer $i -exec echo -e "\t\t$1 - FILE OLDER" \;  -exec cp -r -p $1/$i $tempdir/ \;
echo "---------------"
done
	echo
	echo

echo "==================================="
echo -e "\t\tCopy new file from ."
#ls $1 | while read i
#do
#	echo "$i"
#	find $tempdir -type f ! -name $i -exec echo -e "\t\tIT'S unique" \; -exec cp -r -p $1/$i $tempdir \;
#done
	echo
	echo


echo -e "\t\tPast Work"
ls $tempdir -l
	echo
	echo

echo -e "\t\t!!!PROGRAM END!!!"

#DELET TEMDIR
#rm -r $tempdir

exit 0
