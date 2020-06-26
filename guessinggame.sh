#!usr/bin/env bash
# File: guessinggame.sh
input() {
unset guess
while [ -z "${guess##*[!0-9]*}" ]
do
	read guess
done
}
echo "Guess the number of files in your current directory"
input
num=$(ls|wc -l)
while [ "$guess" -ne "$num" ]
do
	if [ "$guess" -ge "$num" ]; then
		echo "The number you guessed is greater than actual value, Try again"
		input
	elif [ "$guess" -le "$num" ]; then
		echo "The number you guessed is lesser than actual value, Try again"
		input
	fi
done
if [ "$guess" -eq "$num" ]; then
	echo "Congratulations you guessed the correct value" 
fi
