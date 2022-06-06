#!usr/bin/sh
sudo apt install dialog
while true
do
	dialog --title "Dyupin Andrey Site" --menu "Choose point." 0 0 0 \
	1 "Download required packages" \
	2 "Download last version of site from GITHUB" \
	3 "Copy downloaded site to /var/www/html" \
	4 "Open site with Apache2 " \
	5 "Exit" \
	2> results.tmp
	code=$(cat results.tmp)
	sudo rm results.tmp
	if [ "$code" == "1" ]; then
		clear
		sudo apt update
		sudo apt install apache2 git ufw firefox
	elif [ "$code" == "2" ]; then
		clear
		if [[ -d ./html/ ]]; then
			sudo rm -r ./html
		fi
		sudo git clone "https://github.com/Dyupich/bnch_site_2022" ./html
	elif [ "$code" == "3" ]; then
		clear
		if [[ -d /var/www/html/ ]]; then
			sudo rm -r /var/www/html/
		fi
		echo "Trying to copy..."
		sudo cp -r ./html /var/www/html
		
	elif [ "$code" == "4" ]; then
		clear
		sudo service apache2 start
		firefox --new-window localhost
	elif [ "$code" == "5" ]; then
		clear
		break
		echo "Exited..."
	fi
done

