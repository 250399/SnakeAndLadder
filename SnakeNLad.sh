#!/bin/bash


playFunc () {
	local playerChance=$1
	local position=${player[$playerChance]}
	local diceRoll=$((RANDOM%6+1))
	local noOfRoll=$((noOfRoll+1))
	r=$((RANDOM%3))
	if [ $r -eq 0 ]
	then
		if [[ "$((position+diceRoll))" -le 100 ]] 
		then
			position=$((position+diceRoll))
			player[$playerChance]=$position
			echo "Player" $playerChance ":"$position
		fi
	elif [ $r -eq 1 ]
	then
		if [[ "$((position-diceRoll))" -ge 0 ]]
		then
		 	position=$((position-diceRoll))
			player[$playerChance]=$position
			echo "Player" $playerChance ":"$position
		fi
	else
		echo "Player" $playerChance ":"$position
	fi
	if [ $diceRoll -eq 6 ]
	then
		playFunc $playerChance
	fi
}

echo "Welcome to snake and Ladder program"

declare -A player
player[1]=0
player[2]=0
noOfRoll=0
playerFlag=1
while true
do
	if [ $playerFlag -eq 1 ] 
	then
		playFunc 1
		playerFlag=2
		if [ ${player[1]} -eq 100 ]
		then
			echo Player 1 won
			break
		else
			continue
		fi
	elif [ $playerFlag -eq 2 ]
	then
		playFunc 2
		playerFlag=1
		if [ ${player[2]} -eq 100 ]
		then
			echo Player 2 won
			break
		else
			continue
		fi

	fi
done
echo Total No of dice Roll : $noOfRoll
