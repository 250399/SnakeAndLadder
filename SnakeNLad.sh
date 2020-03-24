#!/bin/bash


echo "Welcome to snake and Ladder program"

position=0
noOfRoll=0
declare -a dic

while [ $position -ne 100 ]
do
	diceRoll=$((RANDOM%6+1))
	noOfRoll=$((noOfRoll+1))
	r=$((RANDOM%2))

	if [ $r -eq 0 ]
	then
		[[ "$((position+diceRoll))" -gt 100 ]] && continue || position=$((position+diceRoll))
		echo $position
	elif [ $r -eq 1 ]
	then
		[[ "$((position-diceRoll))" -lt "0" ]] && continue || position=$((position-diceRoll))
		echo $position
	else
 		echo $position
	fi
done

echo Total No of dice Roll : $noOfRoll
