#!/bin/bash
# Program to remove 0029,e131 , 0009,1040 tag and all sub data included 
# http://dicomlookup.com/lookup.asp?sw=Tnumber&q=(6000,3000)
# And associate data
# Usage : ./remove0029.sh /path/to/dir/with/DCM_files.dcm
# Prerequisites : Need to have the dcmtk executables installed on your system.
# See the README.md for details on how to install them.

if  [ $# -lt 1 ];
then
  echo "Usage remove0029.sh  [directory1 to process] [directory2] ..."
  exit 1
fi

for var in "$@"
do
    echo "Processing dir : $var"
	find $var -name \*.dcm -type f  -print0  | while read -d '' -r dir 
	do
		 echo "Processing File $dir"
		 dcmodify -imt -nb -e "0029,E131" -e "0009,1040" "$dir"
	done
done
