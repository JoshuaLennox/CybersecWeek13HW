#!/bin/bash

# $1 is date in four digits eg 0312
# $2 is time in two digits for hours eg 07
# $3 is for AM/PM eg AM
# $4 is for game eg Roulette


if [ $4 = 'Poker' ];
then
	awk -F'\t' '{print $1, $4}' $1_Dealer_schedule | grep $2 | grep $3
elif [ $4 = 'Roulette' ];
then
	awk -F'\t' '{print $1, $3}' $1_Dealer_schedule | grep $2 | grep $3
elif [ $4 = 'Blackjack' ];
then
	awk -F'\t' '{print $1, $2}' $1_Dealer_schedule | grep $2 | grep $3
else
	echo "Could not find game"
fi
