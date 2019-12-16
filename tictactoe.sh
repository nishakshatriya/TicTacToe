#!/bin/bash/ -x

echo "Welcome to TIC-TAC-TOE Game"

for(( position=1 ; position<=9 ; position++ ))
do
	gameBoard["$position"]=$position
done

echo ${gameBoard[@]}
