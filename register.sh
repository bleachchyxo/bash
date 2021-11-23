#!/bin/bash

#This is me trying to develop a registering program

x=1
mssg=" "
while [ $x == 1 ]
do
	attempt=0
	clear
	echo "Chuxo's prompt 2021 (C)"
	echo
	echo "[1]Register"
	echo "[2]Login"
	echo
	echo "$mssg"
	read -p 'Enter a number: ' ch
	if [ $ch == 1 ]
	then
		clear
		mssg=" "
		echo "Register"
		echo
		echo
		read -p 'Enter a username: ' user
		reg=1
		while [ $reg == 1 ]
		do
			clear
			echo "Register"
			echo
			echo "$mssg"
			read -sp 'Enter a password: ' pswd1
			echo
			read -sp 'Confirm password: ' pswd2
			if [ $pswd1 == $pswd2 ]
			then
				mssg="[i]Successfully registered"
				reg=0
			else
				mssg="[!]Password does not match"
			fi
		done
	elif [ $ch == 2 ]
	then
		login=1
		mssg=" "
		while [ $login == 1 ]
		do
			clear
			echo "Login"
			echo
			echo "$mssg"
			read -p 'Username: ' iuser
			if [ $iuser == $user ]
			then
				login=0
			else
				mssg="[!]$iuser does not exist"
			fi
		done
		login2=1
		mssg=" "
		while [ $login2 == 1 ]
		do
			clear
			echo "Login"
			echo
			echo "$mssg"
			read -sp 'Password: ' ipswd
			if [ $ipswd == $pswd1 ]
			then
				x=0
				login2=0
				mssg=" "
			else
				mssg="[!]Incorrect password"
				if [ $attempt == 2 ]
				then
					login2=0
					mssg="[!]Too many attempts"
				else
					attempt=$((attempt+1))
				fi
			fi
		done
	else
		mssg="[!]Invalid input"
	fi
done

clear
echo "Hello $user! Welcome to Chuxo's prompt"
echo 
echo "[i] There is nothing to see here, basically you just wasted your time"
echo "by registering here. Anyways have a nice day!."
echo
