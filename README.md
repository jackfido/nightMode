# Night Mode
This files allows to change automatic day/night mode on Ubuntu, tested on Ubuntu Unity 22.04.4 LTS

1. Into `getSunRiseAndSet.sh` file can replace **location** and **tmpfile** variables to set your own location, search into this link for it: https://www.timeanddate.com/sun/
2. Do same into `nightMode.sh` file with the same named variables, they must be same values
3. If you want to change path of work of this script then modify all **~/Public/nightMode/tmp** references into both files, check the path match where the files are located
4. Into `day.sh` file change the theme and icon for your preference
5. Into `night.sh` file change the theme and icon for your preference

Other task to do:
* Run getSunRiseAndSet.sh with startup applications program to download sunset and sunraise data at init
* Run getSunRiseAndSet.sh with crontab, it allows to get the sunset and sunraise values even if u dont reboot ur machine
	0 0 * * * ~/Public/nightMode/getSunRiseAndSet.sh
* Run nightMode.sh every minute to change theme in the exact time of the sunset or sunrise after the file was downloaded

# Light Mode
![Day Mode](https://github.com/jackfido/nightMode/blob/main/Demonstration/Images/Light%20Mode.png)

# Dark Mode
![Night Mode](https://github.com/jackfido/nightMode/blob/main/Demonstration/Images/Dark%20Mode.png)


TODO
* Refresh the downloaded file if a freeze or hibernation ocurrs, must to add a task to check if day change occurs and download fresh file
* Create an UI to automateall this tasks
