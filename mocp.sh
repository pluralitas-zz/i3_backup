#!/bin/sh

MOCSTATE=$(pgrep mocp)

if [[ -z "$MOCSTATE" ]]; then
echo "MOC Player"
exit
fi

SONGTITLE=$(mocp -i | grep 'SongTitle:' | sed -e 's/^.*: //');
ARTIST=$(mocp -i | grep 'Artist:' | sed -e 's/^.*: //');
ALBUM=$(mocp -i | grep 'Album:' | sed -e 's/^.*: //');

if [[ -z "$SONGTITLE" ]]; then
	color="3c3b37"
	echo "MOC Player"
	echo "$color"

else

	title=$(echo "$SONGTITLE" | perl -MURI::Escape -ne 'chomp;print uri_escape($_),"\n"')
	artist=$(echo "$ARTIST" | perl -MURI::Escape -ne 'chomp;print uri_escape($_),"\n"')
	song=$(curl -s "http://makeitpersonal.co/lyrics?artist=$artist&title=$title")
	color="$f3f4f5"

	echo "$ARTIST - $SONGTITLE" | less
	echo "$color"
fi

case $BLOCK_BUTTON in
	1) mocp -G ;; # left click = toggle pause - play
	#	2)			# middle click
	#	3)			# right click
	4) mocp -r ;; # wheel down = previous song
	5) mocp -f ;; # wheel up = next song
esac
