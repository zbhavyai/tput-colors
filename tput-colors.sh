#!/bin/bash
#: Author	: zbhavyai
#: Date		: 2020-08-28
#: Description	: print TPUT text colors


printColors()
{
	printf "\n----------------------------------------------------------------------------------------------------------------------------------"
	defaultTerminal=${TERM}
	printf "\n[INFO] Default TERM=%s" "${defaultTerminal}"

	testTerminal=$1
	printf "\n[INFO] Setting TERM=%s" "${testTerminal}"
	export TERM=${testTerminal}

	supportedColors=$( tput colors )
	printf "\n[INFO] Colors supported by %s = %d\n"  "${testTerminal}" ${supportedColors}
	
	if (( supportedColors > 0 ))
	then
		printf "[INFO] For using foreground colors, use \"tput setaf <n>\"\n"
		printf "[INFO] For using background colors, use \"tput setab <n>\"\n\n"

		#using count for printing new lines after every 8 colors are printed
		count=8

		for ((N=0; N<supportedColors; N++))
		do
			count=$((count-1))

			tput setaf ${N}
			printf "FG %3s" "${N}"
			tput sgr0

			printf " "

			tput setab ${N}
			printf "BG %3s" "${N}"
				tput sgr0

			if [[ count -eq 0 ]]
			then
				printf "\n"
				count=8
			else
				printf "\t"
			fi
		done
	fi

	printf "\n[INFO] Setting back TERM=%s" "${defaultTerminal}"
	export TERM=${defaultTerminal}
	printf "\n----------------------------------------------------------------------------------------------------------------------------------"
	printf "\n\n"

}


#term is set in the connecting terminal
#For direct system, it can be linux
#For PuTTY, it is chosen via Connection -> Data -> Terminal-type string
#printf "\nDefault TERM = %s" $TERM
#printf "\nColors supported = %d\n"  $( tput colors )


#xterm-mono colors
#------------------------------------------------------------------
printColors xterm-mono


#xterm colors
#------------------------------------------------------------------
printColors xterm


#xterm-256color colors
#------------------------------------------------------------------
printColors xterm-256color


