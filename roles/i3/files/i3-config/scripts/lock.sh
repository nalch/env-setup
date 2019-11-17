#!/bin/bash
 
#depends on: imagemagick, i3lock, scrot
 
IMAGE=/tmp/lockscreen.png
TEXT=/tmp/locktext.png
ICON=~/.config/i3/scripts/lock.png

RESOLUTIONS=$(xrandr | grep ' connected primary' | cut -d ' ' -f 4)
PRIMARY=$(echo "$RESOLUTIONS" | cut -d+ -f 1)
PRIMARY_WIDTH=$(echo "$PRIMARY" | cut -dx -f 1)
PRIMARY_HEIGHT=$(echo "$PRIMARY" | cut -dx -f 2)
OFFSET_X=$(echo "$RESOLUTIONS" | cut -d+ -f 2)
OFFSET_Y=$(echo "$RESOLUTIONS" | cut -d+ -f 3)

((ICON_OFFSET_X=$OFFSET_X+$PRIMARY_WIDTH/2-128))
ICON_OFFSET_Y=200
((TEXT_OFFSET_X=$ICON_OFFSET_X-128))
((TEXT_OFFSET_Y=$ICON_OFFSET_Y+286))


scrot $IMAGE
convert $IMAGE -scale 10% -scale 1000% -fill black -colorize 25% $IMAGE
[ -f $TEXT ] || {
    convert -size 500x60 xc:white -font Liberation-Sans -pointsize 26 -fill black -gravity center -annotate +0+0 'Type password to unlock' $TEXT;
    convert $TEXT -alpha set -channel A -evaluate set 50% $TEXT;
}
convert $IMAGE $TEXT -geometry +$TEXT_OFFSET_X+$TEXT_OFFSET_Y -composite $IMAGE
convert $IMAGE $ICON -geometry +$ICON_OFFSET_X+$ICON_OFFSET_Y -composite -matte $IMAGE
i3lock -u -i $IMAGE
