#!/bin/bash
# Program to remove all data in the 6000,3000 overlay data
# http://dicomlookup.com/lookup.asp?sw=Tnumber&q=(6000,3000)
# And associate data
# Usage : ./removeOverlay.sh /path/to/dir/with/DCM_files.dcm
# Prerequisites : Need to have the dcmtk executables installed on your system.
# See the README.md for details on how to install them.

if  [ $# != 1 ];
then
  echo "Usage removeOverlay.sh  [directory to process]"
  exit 1
fi

find $1 -name \*.dcm -type f  -print0  | while read -d '' -r dir 
do
         echo "Processing File $dir"
         dcmodify -imt -nb -e "6000,3000" "$dir"
         dcmodify -imt -nb -e "6000,0010" "$dir"
         dcmodify -imt -nb -e "6000,0011" "$dir"
         dcmodify -imt -nb -e "6000,0022" "$dir"
         dcmodify -imt -nb -e "6000,0040" "$dir"
         dcmodify -imt -nb -e "6000,0050" "$dir"
         dcmodify -imt -nb -e "6000,0100" "$dir"
         dcmodify -imt -nb -e "6000,0102" "$dir"
done
