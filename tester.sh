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

echo -e "${White}Parsing Tester -> (all tests needs to be passed successfuly)${Color_Off}"

if [ -x "$executable" ] ; then
	while [ "$counter" -le 20 ] ;
		do
			args=$(c++ push_swap.cpp && ./a.out 1)
			# sleep 1
			status=$(./push_swap "7801 "8598 "1270 "5660 "3150 "8787 "1520 "8306 "6089 "6759 "7790 "3295 "420 "6823 "1085 "9609 "3732 "9427 "8376 "6107 "56 "6908 "4362 "5823 "5405 "5683 "4252 "4076 "3922 "3539)
			if [[ "$status" != "Error" ]] ; then
				echo -e "${Green}test passed Successfuly ${Color_Off}" $args
			else
				echo -e "${Red}Error in parsing! ${Color_Off}" $args
				echo -e "-> $args\n" >> failed_test.txt
			fi
			((counter++))
		done

	echo -e "${White}Parsing Tester -> (nothing should work)${Color_Off}"

	counter=1

	while [ $counter -le 20 ] ;
		do
			args=$(c++ push_swap.cpp && ./a.out 0)
			status=$(./push_swap "$args")
			if [[ "$status" = "Error" ]] ; then
				echo -e "${Green}Passed ! ${Color_Off}"$args
			else
				echo -e "${Red}This should not work ${Color_Off} - > "$args
				echo -e "$args \n" >> failed_test.txt
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
					out=$(./$executable $input)
					if [[ $out =~ ^[0-9]+$ ]] ; then
						echo -e "${Red}Error: ${Color_Off}push_swap returned a malformed return"
					fi
					if [ $out = "Error" ] ; then
						echo -e "${Purple}Your Push Swap returned ${Color_Off}${Red}Error${Color_Off}"
					elif [ $output -lt 5501 ] ; then
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
					out=$(./$executable $input)
					if [[ $out =~ ^[0-9]+$ ]]; then
						echo -e "${Red}Error: ${Color_Off}push_swap returned a malformed return"
					fi
					if [[ $out = "Error" ]] ; then
						echo -e "${Purple}Your Push Swap returned ${Color_Off}${Red}Error${Color_Off}"
					elif [ $output -lt 701 ] ; then
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
					out=$(./$executable $input)
					if [[ $out =~ ^[0-9]+$ ]]; then
						echo -e "${Red}Error: ${Color_Off}push_swap returned a malformed return"
					fi
					if [[ $out = "Error" ]] ; then
						echo -e "${Purple}Your Push Swap returned ${Color_Off}${Red}Error${Color_Off}"
					elif [ $output -lt 13 ] ; then
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
					out=$(./$executable $input)
					if [[ $out =~ ^[0-9]+$ ]]; then
						echo -e "${Red}Error: ${Color_Off}push_swap returned a malformed return"
					fi
					if [[ $out = "Error" ]] ; then
						echo -e "${Purple}Your Push Swap returned ${Color_Off}${Red}Error${Color_Off}"
					elif [ $output -lt 3 ] ; then
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
else
	echo -e "${Red}executable not found ${Color_Off}must be written as follow ${Green}$executable ${Color_Off}"
fi