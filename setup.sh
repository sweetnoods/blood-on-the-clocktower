#!/bin/bash

townsfolk=(washerwoman librarian investigator chef empath fortune_teller \
 undertaker monk ravenkeeper virgin slayer soldier mayor)
townsfolk=($( shuf -e "${townsfolk[@]}"))
outsiders=(butler drunk recluse saint)
outsiders=($( shuf -e "${outsiders[@]}"))
minion=(poisoner spy scarlet_woman baron)
minion=($( shuf -e "${minion[@]}"))
demon=(imp)

function ts_setup ()
{
	echo "Number of players?" 
	read # get # of players
	
	# add Demon - updated for other campaigns
	PLAYERS=()
	PLAYERS+=( $demon )

	#Add Minions
	if [ $REPLY -gt 9 -a $REPLY -lt 13 ]; then
	for (( i=0; i<2; i++))
		do
	  	PLAYERS+=( ${minion[$i]} )
	 	done
	elif [ $REPLY -gt 12 ]; then
	for (( i=0; i<3; i++))
	 	do 
		PLAYERS+=( ${minion[$i]} )
		done
	else  PLAYERS+=( $minion )
	fi
	
	# Check for baron
	[[ ${PLAYERS[*]} =~ 'baron' ]] && BARON=2 || BARON=0 
	
	# Add Outsiders
	if [ $REPLY -lt 6 -o $REPLY -eq 7 -o $REPLY -eq 10 -o $REPLY -eq 13 ]; then 
		for (( i = 0; i < (0 + $BARON); i++ ))
		do
			PLAYERS+=( ${outsiders[$i]} )
		done
	elif [ $REPLY -eq 6 -o $REPLY -eq 8 -o $REPLY -eq 11 -o $REPLY -eq 14 ]; then
		for (( i=0; i<(1+$BARON); i++))
	 	do 
			PLAYERS+=( ${outsiders[$i]} )
		done
	else 
		for (( i=0; i<(2+$BARON); i++))
	 	do 
			PLAYERS+=( ${outsiders[$i]} )
		done
	fi

	# Count added roles
	k=$(expr "$REPLY" - ${#PLAYERS[*]})

	# Add Townsfolk
	for (( i=0; i < $k ; i++ ))
	do 
		PLAYERS+=( ${townsfolk[$i]} )
	done
	printf '%s\n' "${PLAYERS[@]}"
exit	
}

ts_setup