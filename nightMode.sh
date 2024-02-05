#!/bin/bash
location="monterrey"
tmpfile=~/Public/nightMode/tmp/$location.out

SUNR=$(grep "Sunrise Today" "$tmpfile" | grep -oE '((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))' | head -1)
SUNS=$(grep "Sunset Today" "$tmpfile" | grep -oE '((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))' | tail -1)

# Use $sunrise and $sunset variables to fit your needs. Example:
sunrise=$(date --date="$SUNR" +%Y%m%d%H%M)
sunset=$(date --date="$SUNS" +%Y%m%d%H%M)

hour=$(date +%Y%m%d%H%M)

if [  $hour -gt $sunrise ] && [ $hour -lt $sunset ];
then
    bash ~/Public/nightMode/day.sh
fi

if [ $hour -lt $sunrise ] || [ $hour -gt $sunset ];
then
    bash ~/Public/nightMode/night.sh
fi

