#!/bin/bash/ -x

declare -r TRUE=1
declare -r FALSE=0

echo "Welcome to TIC-TAC-TOE Game"

function resettingBoard(){
	gameBoard=( 1 2 3 4 5 6 7 8 9 )

	echo	" ${gameBoard[0]} ${gameBoard[1]} ${gameBoard[2]} "
	echo 	" ${gameBoard[3]} ${gameBoard[4]} ${gameBoard[5]} "
	echo 	" ${gameBoard[6]} ${gameBoard[7]} ${gameBoard[8]} "
}
resettingBoard

function gettingSymbols(){
	getSymbol=$((RANDOM%2))
	if [ $getSymbol -eq 1 ]
	then
		echo "Player1 got 'X' symbol"
		echo "Player1 will start"
	else
		echo "Player2 got 'X' symbol"
		echo "Player2 will start"
	fi
}

function displayingBoard(){
	echo " __________"
	echo "|_${gameBoard[0]}_|_${gameBoard[1]}_|_${gameBoard[2]}|"
	echo "|_${gameBoard[3]}_|_${gameBoard[4]}_|_${gameBoard[5]}|"
	echo "|_${gameBoard[6]}_|_${gameBoard[7]}_|_${gameBoard[8]}|"
}

function givingCellInput(){
	counter=0
	read -p "enter cell number:" cellNumber
	gameBoard[$(($cellNumber-1))]="X"
	counter=$(($counter+1))
	displayingBoard
}

function checkingRowsForWinning(){
	temp=0
	for((i=0; i<=8; i++))
	do
		if [[ ${gameBoard[$i]} == "X" && ${gameBoard[$(($i+1))]} == "X" && ${gameBoard[$(($i+2))]} == "X" ]]
		then
			temp=$TRUE
			break
		else
			temp=$FALSE
		fi
	done
	echo $temp
}

function checkingColForWinning(){
	temp1=0
	for((i=0; i<=8; i++))
	do
		if [[ ${gameBoard[$i]} == "X" && ${gameBoard[$(($i+3))]} == "X" && ${gameBoard[$(($i+6))]} == "X" ]]
		then
			temp1=$TRUE
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
	fi
	echo $temp2
}

function calculate(){
	gettingSymbols
	counter=0
	while [ $counter -ne 9 ]
	do
		givingCellInput
		echo "before win checker"
		r=$(checkingRowsForWinning)
		c=$(checkingColForWinning)
		d=$(checkingDiagForWinning)
		if [[ $r -eq 1 || $c -eq 1 || $d -eq 1 ]]
		then
			echo "You Win"
			break
		fi
	done
}
calculate

