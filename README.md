# nightMode
This files allows to change automatic darkmode on Ubuntu, tested on Ubuntu Unity 22.04.4 LTS

* Run getSunRiseAndSet.sh with startup applications program to download sunset and sunraise data at init
* Run getSunRiseAndSet.sh with crontab, it allows to get the sunset and sunraise values even if u dont reboot ur machine
	0 0 * * * ~/Public/nightMode/getSunRiseAndSet.sh
* Run nightMode.sh every minute to change theme in the exact time of the sunset or sunrise after the file was downloaded

# Light Mode
![Day Mode](https://github.com/jackfido/nightMode/blob/main/Demonstration/Images/Light%20Mode.png)

# Dark Mode
![Night Mode](https://github.com/jackfido/nightMode/blob/main/Demonstration/Images/Dark%20Mode.png)
