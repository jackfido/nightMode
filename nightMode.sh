#!/bin/bash
hour=$(date +%H)

if [  $hour -gt 6 ] && [ $hour -lt 19 ];
then
    echo "Day theme established"
    bash ~/Public/nightMode/day.sh
fi

if [ $hour -lt 7 ] || [ $hour -gt 18 ];
then
    echo "Night theme established"
    bash ~/Public/nightMode/night.sh
fi
