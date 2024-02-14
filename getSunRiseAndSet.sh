#!/bin/bash

# 1.- Tihs files pretends to get the sunset and sunrise values from: https://www.timeanddate.com/sun/mexico/
# 2.- To save this values into a temporal file, called as the "yourlocation".out
# 3.- Then compares the dates; from the last modified file date to current date in format YYYYmmdd to determine if we have the today values
# 4.- If the file is for yersterday or older then we have to go for the values for today, else, do nothing 
# 
# Additional:
#		run THIS file in startup applications to run when your session start after a shotdown or reboot
#		run crontab -e to run nightMode.sh file, directly, every minute to set theme as soon as the sunset/sunrise occurss -> * * * * * ~/Public/nightMode/nightMode.sh
#		run THIS file in crontab -e every day at 0 hrs to get the new values as soon as new day occurs -> 0 0 * * * ~/Public/nightMode/getSunRiseAndSet.sh
#		run THIS task each 3 hours, it allow us to have the values up-to-date in case of pc enters in hibernatin or freeze state during a day change in the middle night and then do not run update with previous crontab -> 0 0/3 * * * ~/Public/nightMode/getSunRiseAndSet.sh

# file name and location
location="monterrey"
tmpfile=~/Public/nightMode/tmp/$location.out

# get dates from last file and current
lastUpdate=$(date -r $tmpfile +"%Y%m%d")
currentDate=$(date +%Y%m%d)

# compare file date with current date to determine if need download the values
if [ "$lastUpdate" -lt "$currentDate" ]; then
	wget -q "https://www.timeanddate.com/sun/mexico/$location" -O "$tmpfile"

	echo "Monterrey time getted successfully"
	bash ~/Public/nightMode/nightMode.sh
fi
