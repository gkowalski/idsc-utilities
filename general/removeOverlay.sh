#!/bin/bash
# Program to remove all data in the 6000,3000 overlay data
# http://dicomlookup.com/lookup.asp?sw=Tnumber&q=(6000,3000)
# And associate data
# Usage : ./removeOverlay.sh /path/to/dir/with/DCM_files.dcm

if  [ $# != 1 ];
then
  echo "Usage removeOverlay.sh  [directory to process]"
  exit 1
fi

for f in `find $1/ -name \*.dcm -print `
do
         echo "Processing File $f"
         dcmodify -nb -e "6000,3000" $f
         dcmodify -nb -e "6000,0010" $f
         dcmodify -nb -e "6000,0011" $f
         dcmodify -nb -e "6000,0022" $f
         dcmodify -nb -e "6000,0040" $f
         dcmodify -nb -e "6000,0050" $f
         dcmodify -nb -e "6000,0100" $f
         dcmodify -nb -e "6000,0102" $f
 done