#!/bin/bash


echo "Welcome to snake and Ladder program"

position=0

while [ $position -lt 100 ]
do
	diceRoll=$((RANDOM%6+1))

	r=$((RANDOM%2))

	if [ $r -eq 0 ]
	then
		position=$((position+diceRoll))
		echo $position
	elif [ $r -eq 1 ]
	then
		[[ "$((position-diceRoll))" -lt "0" ]] && continue || position=$((position-diceRoll))
		echo $position
	else
 		echo $position
	fi
done
