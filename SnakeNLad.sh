#!/bin/bash


echo "Welcome to snake and Ladder program"

position=0


dieRoll=$((RANDOM%6+1))

r=$((RANDOM%2))

if [ $r -eq 0 ]
then
	echo "Ladder, moving player ahead by" $dieRoll "Position"
elif [ $r -eq 1 ]
then
	echo "Snake, movin player behind by "$dieRoll" Position"
else
 	echo "you Stay there"
fi
