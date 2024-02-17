#!/bin/bash

executable="push_swap"
counter=1

# Reset
Color_Off='\033[0m'

# Regular Colors
Black='\033[0;30m' 
Red='\033[0;31m'   
Green='\033[0;32m' 
Yellow='\033[0;33m'
Blue='\033[0;34m'  
Purple='\033[0;35m'
Cyan='\033[0;36m'  
White='\033[0;37m' 

echo -e "${White}Parsing Tester -> (still gonna add more tests)${Color_Off}"

while [ $counter -le 50 ] ;
	do
		args=$(c++ push_swap.cpp)
		status=$(./push_swap $args)
		if [ "$status" = "Error" ] ; then
			echo -e "${Red}Error in parsing! ${Color_Off}"
			exit 0
		else
			echo -e "${Green}Success ${Color_Off}"
		fi
		((counter++))
	done

while true ; do
	echo -e "options${Blue} : 3 5 100 500"
	echo -e "${Cyan}Whats your desire number to test : ${Color_Off}"
	read response

	if [ $response -eq 500 ] ; then
		if [ -x "$executable" ] ; then
			loop=0
			while [ $loop -le 200 ];
			do
				input=$(jot -r 500 -10000000 10000000)
				output=$(./$executable $input | wc -l)
				if [ $output -lt 5501 ] ; then
					echo -e "${Green}success -> $output ${Color_Off}"
				else
					echo -e "${Red}Error in instructions the number is : ${Color_Off}" $output
				fi
				((loop++))
			done
		else
			echo -e "${Red}executable not found ${Color_Off}must be written as follow ${Green}$executable ${Color_Off}"
		fi

	elif [ $response -eq 100 ] ; then
		if [ -x "$executable" ] ; then
			loop=0
			while [ $loop -le 200 ]; 
			do
				input=$(jot -r 100 -10000000 10000000)
				output=$(./$executable $input | wc -l)
				if [ $output -lt 701 ] ; then
					echo -e "${Green}success -> $output ${Color_Off}"
				else
					echo -e "${Red}Error in instructions the number is : ${Color_Off}" $output
				fi
				((loop++))
			done
		else
			echo -e "${Red}executable not found ${Color_Off}must be written as follow ${Green}$executable ${Color_Off}"
		fi

	elif [ $response -eq 5 ] ; then
		if [ -x "$executable" ] ; then
			loop=0
			while [ $loop -le 200 ];
			do
				input=$(jot -r 5 -10000000 10000000)
				output=$(./$executable $input | wc -l)
				if [ $output -lt 13 ] ; then
					echo -e "${Green}success -> $output ${Color_Off}"
				else
					echo -e "${Red}Error in instructions the number is : ${Color_Off}" $output
				fi
				((loop++))
			done
		else
			echo -e "${Red}executable not found ${Color_Off}must be written as follow ${Green}$executable ${Color_Off}"
		fi

	elif [ $response -eq 3 ] ; then
		if [ -x "$executable" ] ; then
			loop=0
			while [ $loop -le 200 ];
			do
				input=$(jot -r 3 -10000000 10000000)
				output=$(./$executable $input | wc -l)
				if [ $output -lt 3 ] ; then
					echo -e "${Green}success -> $output ${Color_Off}"
				else
					echo -e "${Red}Error in instructions the number is : ${Color_Off}" $output
				fi
				((loop++))
			done
		else
			echo -e "${Red}executable not found ${Color_Off}must be written as follow ${Green}$executable ${Color_Off}"
		fi

	else
		echo -e "${Red}Invalid Option${Color_Off}"

	fi
done