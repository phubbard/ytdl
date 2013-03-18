#!/bin/sh

# pfh@phfactor.net
# 3/18/13
# automatic.sh, an auto-installing script to
#  a) make ~/bin if it doesn't exist and cd into it
#  b) download youtube-dl
#  c) Put the 'download-youtube' script onto the desktop
#
# That's all!

echo -n "Checking for directory ~/bin..."

if [ -d $HOME/bin ] 
then
 echo "found!"
else
 echo "not found, creating..."
 mkdir $HOME/bin
 if [ -d $HOME/bin ] 
 then
  echo "OK"
 else
  echo "Unable to create or use ~/bin, exiting"
  exit 1
 fi
fi
