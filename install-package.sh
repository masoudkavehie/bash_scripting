#! /bin/bash

read -p "Please Enter your name:" name
echo "Hellow ${name}"
echo "Which package would you like to install"
select package in apache2 mysql-server php python3

do
	case $package in
		apache2|mysql-server|php|python3)
		echo "You have selected $package."
		break
		;;
	*)
		echo "Invalid selection,please choose a valid option."
		;;
	esac
done

sudo apt install -y $package
echo "Package installed"
