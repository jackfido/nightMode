#!/bin/bash
location="monterrey"
tmpfile=~/Public/nightMode/tmp/$location.out

SUNR=$(grep "Sunrise Today" "$tmpfile" | grep -oE '((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))' | head -1)
SUNS=$(grep "Sunset Today" "$tmpfile" | grep -oE '((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))' | tail -1)

sunrise=$(date --date="$SUNR" +%Y%m%d%H%M)
sunset=$(date --date="$SUNS" +%Y%m%d%H%M)

# Use $sunrise and $sunset variables to fit your needs. Example:
echo "Sunrise for location $location: $sunrise"
echo "Sunset for location $location: $sunset"

hour=$(date +%Y%m%d%H%M)

echo "Actual time is: $(date +%Y%m%d%H%M)"


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

location2="USTX1200"
tmpfile2=~/Public/nightMode/tmp/$location2.out

SUNR2=$(grep SunriseSunset "$tmpfile2" | grep -oE '((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))' | head -1)
SUNS2=$(grep SunriseSunset "$tmpfile2" | grep -oE '((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))' | tail -1)

sunrise2=$(date --date="$SUNR2" +%Y%m%d%H%M)
sunset2=$(date --date="$SUNS2" +%Y%m%d%H%M)

# Use $sunrise and $sunset variables to fit your needs. Example:
echo "Sunrise for location $location2: $sunrise2"
echo "Sunset for location $location2: $sunset2"

hour2=$(date +%Y%m%d%H%M)

echo "Actual time 2 is: $(date +%Y%m%d%H%M)"

if [  $hour2 -gt $sunrise2 ] && [ $hour2 -lt $sunset2 ];
then
    echo "Aplicar tema de dia"
    bash ~/Public/nightMode/day.sh
fi

if [ $hour2 -lt $sunrise2 ] || [ $hour2 -gt $sunset2 ];
then
    echo "Aplicar tema de noche"
    bash ~/Public/nightMode/night.sh
fi
