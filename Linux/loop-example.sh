#!/bin/bash

days=('mon' 'tues' 'wed' 'thurs' 'fri' 'sat' 'sun')

# list the days of the week
for days in ${days[@]};
do
	echo $days
	if [ $days = 'sat' ] || [ $days = 'sun' ]
	then
		echo "It's the weekend! :)"
	else
		echo "Don't forget ot go to work"
	fi
done
