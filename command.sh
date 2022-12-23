#!/bin/bash
#debug.sh
# creating a custom command without getopts

if [ "$1" == "add" ]
then
        if [ -n "$2" ]
        then
                echo "mkdir $2"
        else
                echo "Error: missing input add"
        fi
elif [ "$1" == "ls" ]
then
        echo "dir"
elif [ "$1" == "rm" ]
then
        if [ -n "$2" ]
        then
                echo "$2"
        else
                echo "Error: missing input rm"
        fi
elif [ "$1" == "--help" ]
then
        echo "Usage: debug.sh [-add] [-ls] [-rm] [--help]"
else
        echo "dir"
fi
