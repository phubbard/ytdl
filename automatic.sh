#!/bin/sh

# pfh@phfactor.net
# 3/18/13
# automatic.sh, an auto-installing script to
#  a) make ~/bin if it doesn't exist and cd into it
#  b) download youtube-dl
#  c) Put the 'download-youtube' script onto the desktop
#
# That's all!
# Intended usage is a one-liner I can email family:
# curl -LO https://github.com/phubbard/ytdl/raw/master/automatic.sh && sh automatic.sh
# 
# Notes: youtube-dl in ~/bin, download-youtube in ~/Desktop, movies into ~/Movies

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

cd $HOME/bin
echo -n "Downloading youtube-dl..."
curl -LO https://github.com/rg3/youtube-dl/raw/master/youtube-dl
if [ -f youtube-dl ]
then
  echo "downloaded."
  echo -n "Making executable..."
  chmod 755 youtube-dl
  echo "done"
else
  echo "Unable to download youtube-dl, exiting" 
  exit 2
fi

if [ -d $HOME/Desktop ]
then
 echo "Heading to Desktop to download wrapper script"
 cd $HOME/Desktop
 echo "Downloading wrapper..."
 curl -LO https://github.com/phubbard/ytdl/raw/master/download-youtube
 if [ -f download-youtube ]
 then
  echo "downloaded, marking executable"
  chmod 755 download-youtube
  echo "And we're all done! Enjoy."
  exit 0
 else
  echo "Error downloading wrapper, maybe check and retry"
  exit 3
 fi
else
 echo "Unable to find destination Desktop directory"
 exit 4
fi
