#!/bin/bash


playFunc () {
	local playerChance=$1
	local position=${player[$playerChance]}
	local diceRoll=$((RANDOM%6+1))
	noOfRoll=$((noOfRoll+1))
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

checkWin () {
  	while true
	do
   		if [ ${player[$playerFlag]} -eq 100 ]
      		then
        		echo Player $playerFlag won
        		break
      		fi
      		playFunc $playerFlag
      		if [ $playerFlag -eq 2 ]
          	then
              		playerFlag=1
          	else
            		playerFlag=2
          	fi
  	done
}
echo "Welcome to snake and Ladder program"

declare -A player
player[1]=0
player[2]=0
noOfRoll=0
playerFlag=1
checkWin
echo Total No of dice Roll : $noOfRoll
