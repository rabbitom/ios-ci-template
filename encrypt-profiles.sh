#!/bin/sh
filelist=`ls profiles/`
for file in $filelist
do 
  travis encrypt-file profiles/$file scripts/$file.enc --add
done