#!/bin/bash

# Simply csv to vcard converter
# by Irek Pelech
# (c) 2017 Ascot

function build_vcard() {
cat <<EOF >> $VCARDFILE
BEGIN:VCARD
VERSION:3.0
N:${LNAME};${FNAME};;;
FN:${FNAME} ${LNAME}
TEL;TYPE=MOBILE;TYPE=VOICE:${PNUMBER}
EMAIL;TYPE=HOME;TYPE=pref;TYPE=INTERNET:${EMAIL}
END:VCARD
EOF
}

function help(){
cat <<EOF
csv2vcard v. 0.1 (c) 2017 by Irek 'Monsoft' Pelech
Usage: csv2vcard CSV_file vCARD_file.vcf
Options:
		CSV_file      	File with contact details separated by comma:
				"First Name","Last Name","email","Phone number"
		vCARD_file.vcf  Output file for contacts in vCard format

EOF
}

## Check if any paramaters ##
if [ $# -ne 2 ]
        then
        help
        exit 0
fi

# variables
CVSFILE=$1
VCARDFILE=$2
COUNT=0

while IFS=, read FNAME LNAME EMAIL PNUMBER
do
	build_vcard
	COUNT=$((COUNT + 1))
done < $CVSFILE


help|head -n1
echo "Convertion done ..."
echo "Converted ${COUNT} contacts"
