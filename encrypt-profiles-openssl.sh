#!/bin/sh
password=`uuidgen`
travis encrypt "ENCRYPTION_SECRET=$password" --add
filelist=`ls profiles/`
for file in $filelist
do
  openssl aes-256-cbc -k "$password" -in profiles/$file -out scripts/$file.enc -a
  echo "- openssl aes-256-cbc -k \"$ENCRYPTION_SECRET\" -in scripts/$file.enc -d -a -out profiles/$file" >> scripts/decrypt-keys.sh
done