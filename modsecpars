#!/bin/bash
# Small Mod Security Log parser
# by Irek 'Monsoft' Pelech

IP=$1
FILE=$2

# get incident IDs
function get_iid () {
	local ATTACKER_IP=$1
	local LOG_FILE=$2
	
	IID=($(grep -B1 "$ATTACKER_IP" $LOG_FILE|grep  '\-A\-\-'|sed 's/--//g'))
}

function get_incidents () {
	local LOG_FILE=$1
	local X=0
	
	for i in ${IID[@]}
	do 
		X=$(echo ${i/A/H})
		echo "$(grep -A 1 "$X" $LOG_FILE|egrep -Eo -m1 'id "[0-9]{6}"|msg \"([^]]+)\"'|tr '\n' ' ')"
	done |sort| uniq -c 
}

function show_ips () {
	local LOG_FILE=$1
	IIP=($(grep -A1 '\-A\-\-'  "$LOG_FILE"|grep -v '\-A\-\-'|sed '/^--/d'|awk '{print $4}'))
	for i in ${IIP[@]}
	do
		echo $i
	done|sort -n| uniq
}

function help () {
	cat <<EOF
modsecpars v. 1.0.0 (c) 2017 by Irek Pelech"
Usage: modsecpars [IP|log_file] [log_file]
EOF
}


### MAIN

# Print help
if [ $# -eq 0 ]
	then
		help
	exit 0
fi

# Show intruders IPs
if [ $# -eq 1 ]
	then
		for i in $(show_ips $IP)
		do
			echo "Attacker IP: $i"
			get_iid $i $IP
			get_incidents $IP
		done
		exit 0
fi


get_iid $IP $FILE
get_incidents $FILE
