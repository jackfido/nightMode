#!/bin/bash

# First obtain a location code from: https://weather.codes/search/

# Insert your location. For example LOXX0001 is a location code for Bratislava, Slovakia
# Mi ciudad mas proxima es San Antonio
location="USTX1200"
tmpfile=/tmp/$location.out

# Obtain sunrise and sunset raw data from weather.com
wget -q "https://weather.com/weather/today/l/$location" -O "$tmpfile"

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
