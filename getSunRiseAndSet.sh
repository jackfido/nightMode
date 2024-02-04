#!/bin/bash


# First obtain a location code from: https://weather.codes/search/

# Insert your location. For example USTX1200 is a location code for San Antonio, Texas
location="USTX1200"
tmpfile=~/Public/nightMode/tmp/$location.out

# Obtain sunrise and sunset raw data from weather.com
wget -q "https://weather.com/weather/today/l/$location" -O "$tmpfile"
echo "San Antonio time getted successfully"

location="monterrey"
tmpfile=~/Public/nightMode/tmp/$location.out

wget -q "https://www.timeanddate.com/sun/mexico/$location" -O "$tmpfile"

echo "Monterrey time getted successfully"
