#!/bin/bash/ -x

echo "Welcome to TIC-TAC-TOE Game"

function resettingBoard(){
	gameBoard=( 1 2 3 4 5 6 7 8 9 )

	echo	" ${gameBoard[0]} ${gameBoard[1]} ${gameBoard[2]} "
	echo 	" ${gameBoard[3]} ${gameBoard[4]} ${gameBoard[5]} "
	echo 	" ${gameBoard[6]} ${gameBoard[7]} ${gameBoard[8]} "
}

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
	for(( i=0; i<9; i++ ))
	do
		read -p "enter cell number:" cellNumber
		if [[ ${gameBoard[$i]} -eq $cellNumber ]]
		then
			gameBoard[$(($cellNumber - 1))]="X"
			counter=$(($counter+1))
			displayingBoard
		else
			echo "Cant Print on that index"
		fi
	done
}

function calculate(){
	while [[ $counter -ne 9 ]]
	do
		gettingSymbols
		givingCellInput
	done
}
calculate
