#!/bin/bash

# First obtain a location code from: https://www.timeanddate.com/sun/mexico/

# Insert your location. For example 'monterrey' is a location for Nuevo León, México

location="monterrey"
tmpfile=~/Public/nightMode/tmp/$location.out

wget -q "https://www.timeanddate.com/sun/mexico/$location" -O "$tmpfile"

echo "Monterrey time getted successfully"

bash ~/Public/nightMode/nightMode.sh
