#!/bin/bash
location="USTX1200"
tmpfile=~/Public/nightMode/tmp/$location.out

SUNR=$(grep SunriseSunset "$tmpfile" | grep -oE '((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))' | head -1)
SUNS=$(grep SunriseSunset "$tmpfile" | grep -oE '((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))' | tail -1)

sunrise=$(date --date="$SUNR" +%Y%m%d%H%M)
sunset=$(date --date="$SUNS" +%Y%m%d%H%M)

# Use $sunrise and $sunset variables to fit your needs. Example:
echo "Sunrise for location $location: $sunrise"
echo "Sunset for location $location: $sunset"

hour=$(date +%Y%m%d%H%M)

echo "Actual time is: $sunrise"

if [  $hour -gt $sunrise ] && [ $hour -lt $sunset ];
then
    echo "Aplicar tema de dia"
    bash ~/Public/nightMode/day.sh
fi

if [ $hour -lt $sunrise ] || [ $hour -gt $sunset ];
then
    echo "Aplicar tema de noche"
    bash ~/Public/nightMode/night.sh
fi
