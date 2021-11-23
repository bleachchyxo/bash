#!/bin/bash

while true; do
read -rsn1 input
if [ "$input" = "w" ]; then
    echo "UP"
elif [ "$input" = "a" ]; then
	echo "LEFT"
elif [ "$input" = "s" ]; then
	echo "DOWN"
elif [ "$input" = "d" ]; then
	echo "RIGHT"
fi
done
