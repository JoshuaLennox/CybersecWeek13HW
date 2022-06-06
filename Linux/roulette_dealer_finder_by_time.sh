#! /bin/bash

# $1 is date in four digits eg 0312
# $2 is time in two digits for hours eg 07
# $3 is for AM/PM eg AM

awk -F'\t' '{print $1, $3}' $1_Dealer_schedule | grep $2 | grep $3


