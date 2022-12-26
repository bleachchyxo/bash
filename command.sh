#!/bin/bash
#debug.sh
# creating a custom command without getopts

#!/bin/bash

if [ "$1" == "add" ]
then
        if [ -n "$2" ]
        then
                echo "mkdir $2"
        else
                echo "Usage"
        fi
elif [ "$1" == "ls" ]
then
        echo "dir"
elif [ -f "$1" ]
then
        echo "cat $1"
else
        echo "usage"
fi
