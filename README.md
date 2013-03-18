## What is this?

I have a semi-technical mom. She wants a simple way to download youtube videos on her
Macintosh. Running the awesome https://github.com/rg3/youtube-dl exceeds her skills,
so I wrote a 3-liner shell script that

- cds into ~/Movies
- Takes the clipboard and feeds it to youtube-dl

Usage is pretty easy - she copies the URL into the clipboard, then double-clicks 
'download-youtube' on her desktop. The file is auto-named using the -l function of
youtube-dl, and placed in her Movies directory. I also had to install VLC to play
FLV files, but it was a decent solution.

Then she wanted to be able to replicate this for her better half. Who isn't here on this
visit. So I wrote this repo, which is a shell script to download the files, put them into
~/bin and ~/Desktop, and set the permissions (755) accordingly.

## How It Should Work

curl -LO https://github.com/phubbard/ytdl/raw/master/automatic.sh && sh ./automatic.sh && rm automatic.sh

## Notes and bugs
Does not check result codes, so if you are missing curl or somesuch it'll no doubt fail.
