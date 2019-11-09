#!/bin/sh

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

echo -e "\t\tCopy from $2 to NEWTEMPDIR"
cp -r $2/ /home/sm/workf/workin/newtempdir/
	echo
	echo

echo -e "\t\tTime comparison"
ls /home/sm/workf/wokin/NEWTEMPDIR | while read i
do
echo  "$i"
find $1 -type f -name $i -newer $i -exec echo -e "\t\t$1 - FILE OLDER" \; -exec cp $1/$i /home/sm/workf/wokin/NEWTEMPDIR \;
echo "---------------"
done
	echo
	echo

echo -e "\t\tCopy new file from ."
ls $1 | while read i
do
echo "$i"
find /home/sm/workf/wokin/NEWTEMPDIR -type f ! -name $i -exec cp $1/$i /home/sm/workf/wokin/NEWTEMPDIR \;
done
	echo
	echo

echo -e "\t\t!!!PROGRAM END!!!"

exit 0
