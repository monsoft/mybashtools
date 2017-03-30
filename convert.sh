#!/bin/bash
# Simple script to convert between curriencies by Irek
# Ascot (c) 2012

# Check if curl is installed
curl -V >/dev/null 2>&1|| { echo "I require curl but it's not installed. Aborting." >&2; exit 1;} 

# Check internet connectivity
curl -v www.google.co.uk 2>&1|grep -m1 "HTTP/1.1" >/dev/null 2>&1|| { echo "I require internet connection. Aborting." >&2; exit 1;}
# Main
if [ $# -ne 3 ]
	then
		echo -e "\nAvailable currencies:"
		echo -e "---------------------\n"

		curl http://www.google.co.uk/finance/converter 2>&1|awk '/<select name=from value="">/,/<\/select>/'|sed -e 's/<[^>]*>//g'|sed '/^$/d'|tr "\n" ","|awk -F, '{ for ( i=1; i<=NF;i=i+2) print $i"\t\t\t"$(i+1)}'
               	echo -e "\nUsage: `basename $0` ammount From To"
               	echo -e "------------------------------------"
		echo -e "Example:\n`basename $0` 20 PLN USD"

		exit 
fi

AMMOUNT=$1
FROM=$2
TO=$3

echo "Currency converter v1 by Monsoft"
echo "Based on google finance converter"
echo "---------------------------------"
 curl "https://www.google.co.uk/finance/converter?a=${AMMOUNT}&from=${FROM}&to=${TO}" 2>&1|grep currency_converter_result|sed -e 's/<[^>]*>//g'
