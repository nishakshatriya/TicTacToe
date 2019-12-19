#!/bin/bash/ -x

#CONSTANT
 TRUE=1
 FALSE=0
 POSITIVE=2

#variables
turn=" "
counter=0

echo "Welcome to TIC-TAC-TOE Game"

function resettingBoard(){
	gameBoard=( 1 2 3 4 5 6 7 8 9 )
	echo " __________"
	echo "|_${gameBoard[0]}_|_${gameBoard[1]}_|_${gameBoard[2]}|"
	echo "|_${gameBoard[3]}_|_${gameBoard[4]}_|_${gameBoard[5]}|"
	echo "|_${gameBoard[6]}_|_${gameBoard[7]}_|_${gameBoard[8]}|"
}
resettingBoard

function gettingSymbols(){
	getSymbol=$((RANDOM%2))
	if [ $getSymbol -eq 1 ]
	then
		turn="User"
		echo "Player got 'X' symbol & Player will start first!"
	else
		turn="Computer"
		echo "Computer got 'O' symbol & Computer will start first!"
	fi
}

function displayingBoard(){
	echo " __________"
	echo "|_${gameBoard[0]}_|_${gameBoard[1]}_|_${gameBoard[2]}|"
	echo "|_${gameBoard[3]}_|_${gameBoard[4]}_|_${gameBoard[5]}|"
	echo "|_${gameBoard[6]}_|_${gameBoard[7]}_|_${gameBoard[8]}|"
}

function checkingOpponent(){
	flag=0
	for((i=0; i<=8; i++))
	do
		if [[ ${gameBoard[$i]} == "X" && ${gameBoard[$(($i+1))]} == "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($i+2))]}
			break
		elif [[ ${gameBoard[$(($i+1))]} == "X" && ${gameBoard[$(($i+2))]} == "X" ]]
		then
			flag=1
			echo ${gameBoard[$i]} 
			break
		elif [[ ${gameBoard[$i]} == "X" && ${gameBoard[$(($i+2))]} == "X" ]]
		then
			flag=1
			echo  ${gameBoard[$(($i+1))]}
			break
		elif [[ ${gameBoard[$i]} == "X" && ${gameBoard[$(($i+3))]} == "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($i+6))]}
			break
		elif [[ ${gameBoard[$(($i+3))]} == "X" && ${gameBoard[$(($i+6))]} == "X" ]]
		then
			flag=1
			echo ${gameBoard[$i]}
			break
		elif [[ ${gameBoard[$i]} == "X" && ${gameBoard[$(($i+6))]} == "X" ]]
		then
			flag=1
			echo ${gameBoard[$i+3]}
			break
		elif [[ ${gameBoard[$(($i+2))]} == "X" && ${gameBoard[$((i+4))]} == "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($i+6))]}
		break
		elif [[ ${gameBoard[$(($i+4))]} == "X" && ${gameBoard[$(($i+6))]} == "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($i+2))]}
			break
		elif [[ ${gameBoard[$(($i+2))]} == "X" && ${gameBoard[$(($i+6))]} == "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($i+4))]}
			break
		 elif [[ ${gameBoard[$i]} == "X" && ${gameBoard[$((i+4))]} == "X" ]]
      then
         flag=1
         echo ${gameBoard[$(($i+8))]}
      break
      elif [[ ${gameBoard[$(($i+4))]} == "X" && ${gameBoard[$(($i+8))]} == "X" ]]
      then
         flag=1
         echo ${gameBoard[$i]}
         break
      elif [[ ${gameBoard[$i]} == "X" && ${gameBoard[$(($i+8))]} == "X" ]]
      then
         flag=1
         echo ${gameBoard[$(($i+4))]}
         break

	fi
	done
if [[ $flag -eq 0 ]]
then
	randomCell=$((RANDOM%9+1))
	echo $randomCell
fi
}

function givingCellInput(){
	echo "user"
	read -p "enter cell number:" cellNumber
	for((i=0; i<=8; i++))
	do
		if [[ ${gameBoard[$i]} -eq $cellNumber ]]
		then
			gameBoard[$(($cellNumber-1))]="X"
			counter=$(($counter+1))
			displayingBoard
		fi
		turn="Computer"
	done
}

function givingComputerInput(){
	echo "computer"
	cellNumber=$(checkingOpponent)
	for((i=0; i<=8; i++))
	do
		if [[ ${gameBoard[$i]} -eq $cellNumber ]]
		then
			gameBoard[$(($cellNumber-1))]="O"
			counter=$(($counter+1))
			turn="User"
			displayingBoard
			break
		fi
		turn="Computer"
	done
}

function checkingRowsForWinning(){
	temp=0
	for((i=0; i<=8; i=$((i+3)) ))
	do
		if [[ ${gameBoard[$i]} == "X" && ${gameBoard[$(($i+1))]} == "X" && ${gameBoard[$(($i+2))]} == "X" ]]
		then
			temp=$TRUE
			break
		elif [[ ${gameBoard[$i]} == "O" && ${gameBoard[$(($i+1))]} == "O" && ${gameBoard[$(($i+2))]} == "O" ]]
		then
			temp=$POSITIVE
			break
		else
			temp=$FALSE
		fi
	done
	echo $temp
}

function checkingColForWinning(){
	temp1=0
	for((i=0; i<=2; i++))
	do
		if [[ ${gameBoard[$i]} == "X" && ${gameBoard[$(($i+3))]} == "X" && ${gameBoard[$(($i+6))]} == "X" ]]
		then
			temp1=$TRUE
			break
		elif [[ ${gameBoard[$i]} == "O" && ${gameBoard[$(($i+3))]} == "O" && ${gameBoard[$(($i+6))]} == "O" ]]
		then
			temp1=$POSITIVE
			break
		else
			temp1=$FALSE
		fi
	done
	echo $temp1
}

function checkingDiagForWinning(){
	temp2=0
	i=0
	if [[ ${gameBoard[$i]} == "X" && ${gameBoard[$(($i+4))]} == "X" && ${gameBoard[$(($i+8))]} == "X" ]]
	then
		temp2=$TRUE
	elif [[ ${gameBoard[$(($i+2))]} == "X" && ${gameBoard[$(($i+4))]} == "X" && ${gameBoard[$(($i+6))]} == "X" ]]
	then
		temp2=$TRUE
	elif [[ ${gameBoard[$(($i))]} == "O" && ${gameBoard[$(($i+4))]} == "O" && ${gameBoard[$(($i+8))]} == "O" ]]
	then
		temp2=$POSITIVE
	elif [[ ${gameBoard[$(($i+2))]} == "O" && ${gameBoard[$(($i+4))]} == "O" && ${gameBoard[$(($i+8))]} == "O" ]]
	then
		temp2=$POSITIVE
	else
		temp2=$FALSE
	fi
	echo $temp2
}

function playingTicTacToe(){
	gettingSymbols
	counter=0
	while [ $counter -ne 9 ]
	do
		if [[ $turn == "Computer" ]]
		then
			givingComputerInput
		else
			givingCellInput
		fi
		rows=$(checkingRowsForWinning)
		cols=$(checkingColForWinning)
		diag=$(checkingDiagForWinning)
		if [[ $rows -eq 1 || $cols -eq 1 || $diag -eq 1 ]]
		then
			echo "player Win!!"
			break
		elif [[ $rows -eq 2 || $cols -eq 2 || $diag -eq 2 ]]
		then
			echo "Computer win!!"
			break
		fi
	done
}
playingTicTacToe

