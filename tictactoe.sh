#!/bin/bash/ -x

echo "Welcome to TIC-TAC-TOE Game"

function resettingBoard(){
	gameBoard=( 1 2 3 4 5 6 7 8 9 )

	echo	" ${gameBoard[0]} ${gameBoard[1]} ${gameBoard[2]} "
	echo 	" ${gameBoard[3]} ${gameBoard[4]} ${gameBoard[5]} "
	echo 	" ${gameBoard[6]} ${gameBoard[7]} ${gameBoard[8]} "
}

function gettingSymbols(){
	resettingBoard
	if [ $((RANDOM%2)) -eq 1 ]
	then
		echo "Player got 'X' symbol"
	else
		echo "Player got 'O' symbol"
	fi
}
gettingSymbols
