#!/bin/bash

declare -a y1=("." "." "." "." "." "." "." "." "." ".")
declare -a y2=("." "." "." "." "." "." "." "." "." ".")
declare -a y3=("." "." "." "." "." "." "." "." "." ".")
declare -a y4=("." "." "." "." "." "." "." "." "." ".")
declare -a y5=("." "." "." "." "." "." "." "." "." ".")
declare -a y6=("." "." "." "." "." "." "." "." "." ".")

# default presets
y=4
x=5
y4[$x]="@"
rend=1
keys=1
message=" "

#loop for rendering and keys
while [ $rend == 1 ]
do

# map render
    clear
    echo "y=$y x=$x"
    echo
    printf %s "${y1[@]}" $'\n'
    printf %s "${y2[@]}" $'\n'
    printf %s "${y3[@]}" $'\n'
    printf %s "${y4[@]}" $'\n'
    printf %s "${y5[@]}" $'\n'
    printf %s "${y6[@]}" $'\n'
    echo
    echo "$message"

# controls
    read -rsn1 input
    # UP
    if [ "$input" = "w" ]; then
	y=$((y-1))
	if [ $y == 0 ]; then
	    y=$((y+1))
	    message="You can't go any further"
	else
            message=" "
	fi
	eval "y$y"'[$x]=@'
	eval "y$((y+1))"'[$x]=.'
    # LEFT
    elif [ "$input" = "a" ]; then
	  x=$((x-1))
	  if [ $x == -1 ]; then
	      x=$((x+1))
	      message="You can't go any further"
	  else
              message=" "
	  fi
	  eval "y$y"'[$x]=@'
	  eval "y$y"'[$((x+1))]=.'
    # DOWN
    elif [ "$input" = "s" ]; then
	  y=$((y+1))
	  if [ $y == 7 ]; then
	      y=$((y-1))
	      message="You can't go any further"
	  else
	      message=" "
	  fi
	  eval "y$y"'[$x]=@'
	  eval "y$((y-1))"'[$x]=.'
    # RIGHT
    elif [ "$input" = "d" ]; then
	  x=$((x+1))
	  if [ $x == 10 ]; then
	      x=$((x-1))
	      message="You can't go any further"
	  else
	      message=" "
	  fi
	  eval "y$y"'[$x]=@'
	  eval "y$y"'[$((x-1))]=.'
    fi
    

done
