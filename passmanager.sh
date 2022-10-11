#!/bin/bash

# Checking if PassManager already installed
[ -d "/home/$USER/.passmanager" ] && passmanagerdir=1 || passmanagerdir=0

# PassManager install
if [ $passmanagerdir -eq 0 ]; then
	echo "Installing PassManager."
	read -p 'Do you want to continue? [Y/n] ' installcheck
	[[ $installcheck == y* ]] && passmanagermkdir=1 || passmanagermkdir=0
	if [ $passmanagermkdir -eq 1 ]; then
		mkdir /home/$USER/.passmanager
	else
		echo Abort.
		exit
	fi
fi	

case $1 in

	"-c")
		echo "mkdir"
	;;

	"-d")
		echo "del"
	;;
esac
